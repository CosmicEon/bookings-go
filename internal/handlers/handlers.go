package handlers

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/cosmiceon/bookings-go/internal/config"
	"github.com/cosmiceon/bookings-go/internal/forms"
	"github.com/cosmiceon/bookings-go/internal/helpers"
	"github.com/cosmiceon/bookings-go/internal/models"
	"github.com/cosmiceon/bookings-go/internal/render"
)

var Repo *Repository

type Repository struct {
	App *config.AppConfig
}

func NewRepo(a *config.AppConfig) *Repository {
	return &Repository{
		App: a,
	}
}

func NewHandlers(r *Repository) {
	Repo = r
}

// Home is the home page handler
func (m *Repository) Home(w http.ResponseWriter, r *http.Request) {
	stringMap := make(map[string]string)
	stringMap["test"] = "Hello, again"

	remoteIP := r.RemoteAddr
	m.App.Session.Put(r.Context(), "remote_ip", remoteIP)

	render.RenderTempalate(w, r, "home.page.tpl", &models.TemplateData{
		StringMap: stringMap,
	})
}

// About is the about page handler
func (m *Repository) Contact(w http.ResponseWriter, r *http.Request) {
	stringMap := make(map[string]string)

	remoteIP := m.App.Session.GetString(r.Context(), "remote_ip")
	stringMap["remote_ip"] = remoteIP

	render.RenderTempalate(w, r, "contact.page.tpl", &models.TemplateData{
		StringMap: stringMap,
	})
}

func (m *Repository) About(w http.ResponseWriter, r *http.Request) {
	render.RenderTempalate(w, r, "about.page.tpl", &models.TemplateData{})
}

func (m *Repository) Generals(w http.ResponseWriter, r *http.Request) {
	render.RenderTempalate(w, r, "room.generals.page.tpl", &models.TemplateData{})
}

func (m *Repository) Majors(w http.ResponseWriter, r *http.Request) {
	render.RenderTempalate(w, r, "room.majors.page.tpl", &models.TemplateData{})
}

func (m *Repository) SearchAvailability(w http.ResponseWriter, r *http.Request) {

	render.RenderTempalate(w, r, "search-availability.page.tpl", &models.TemplateData{})
}

func (m *Repository) PostSearchAvailability(w http.ResponseWriter, r *http.Request) {
	star := r.Form.Get("start_date")
	end := r.Form.Get("end_date")

	w.Write([]byte(fmt.Sprintf("Start date is %s and end date is %s", star, end)))
	// render.RenderTempalate(w, "search-availability.page.tpl", &models.TemplateData{})
}

type jsonResponse struct {
	OK      bool   `json:"ok"`
	Message string `json:"message"`
}

func (m *Repository) SearchAvailabilityJSON(w http.ResponseWriter, r *http.Request) {
	response := jsonResponse{
		OK:      true,
		Message: "Available!",
	}

	fmt.Println(r.Body)

	out, err := json.MarshalIndent(response, "", "	")
	if err != nil {
		helpers.ServerError(w, err)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(out)
}

func (m *Repository) Reservation(w http.ResponseWriter, r *http.Request) {
	var emptyReservation models.Reservation
	data := make(map[string]interface{})
	data["reservation"] = emptyReservation

	render.RenderTempalate(w, r, "make-reservation.page.tpl", &models.TemplateData{
		Form: forms.New(nil),
		Data: data,
	})
}

func (m *Repository) PostReservation(w http.ResponseWriter, r *http.Request) {
	err := r.ParseForm()
	if err != nil {
		helpers.ServerError(w, err)
		return
	}

	reservation := models.Reservation{
		FirstName: r.Form.Get("first_name"),
		LastName:  r.Form.Get("last_name"),
		Phone:     r.Form.Get("phone"),
		Email:     r.Form.Get("email"),
	}

	form := forms.New(r.PostForm)

	form.Required("first_name", "last_name", "email", "phone")
	form.MinLength("first_name", 3)
	form.IsEmail("email")

	if !form.Valid() {
		data := make(map[string]interface{})
		data["reservation"] = reservation

		render.RenderTempalate(w, r, "make-reservation.page.tpl", &models.TemplateData{
			Form: form,
			Data: data,
		})
		return
	}

	m.App.Session.Put(r.Context(), "reservation-form", reservation)
	http.Redirect(w, r, "/reservation-summary", http.StatusSeeOther)
}

func (m *Repository) ReservationSummary(w http.ResponseWriter, r *http.Request) {
	reservation, ok := m.App.Session.Get(r.Context(), "reservation-form").(models.Reservation)
	if !ok {
		m.App.ErrorLog.Println("cannot get item from session")
		m.App.Session.Put(r.Context(), "error", "Can't get reservation form session.")
		http.Redirect(w, r, "/", http.StatusTemporaryRedirect)
		return
	}

	m.App.Session.Remove(r.Context(), "reservation-form")

	data := make(map[string]interface{})
	data["reservation"] = reservation

	render.RenderTempalate(w, r, "reservation-summary.page.tpl", &models.TemplateData{
		Data: data,
	})
}
