package forms

import (
	"net/http"
	"net/http/httptest"
	"net/url"
	"testing"
)

func TestForm_Valid(t *testing.T) {
	r := httptest.NewRequest("POST", "/api", nil)
	form := New(r.PostForm)

	isValid := form.Valid()
	if !isValid {
		t.Error("got invalid when should have been valid")
	}
}

func TestFrom_Required(t *testing.T) {
	r := httptest.NewRequest("POST", "/api", nil)
	form := New(r.Form)

	form.Required("a", "b", "c")
	if form.Valid() {
		t.Error("form shows valid when required fields missing")
	}

	postedData := url.Values{}
	postedData.Add("a", "a")
	postedData.Add("b", "b")
	postedData.Add("c", "c")

	r, _ = http.NewRequest("POST", "/api", nil)

	r.PostForm = postedData
	form = New(r.PostForm)
	form.Required("a", "b", "c")
	if !form.Valid() {
		t.Error("shows does not have required fields when it does")
	}
}

func TestForm_Has(t *testing.T) {
	r := httptest.NewRequest("POST", "/api", nil)
	form := New(r.PostForm)

	has := form.Has("something")
	if has {
		t.Error("form shows has field when it does not")
	}

	postedData := url.Values{}
	postedData.Add("a", "a")

	form = New(postedData)
	has = form.Has("a")
	if !has {
		t.Error("shows form does not have field when it should")
	}
}

func TestForm_MinLength(t *testing.T) {
	r := httptest.NewRequest("POST", "/api", nil)
	form := New(r.PostForm)

	form.MinLength("x", 10)
	if form.Valid() {
		t.Error("form shows min length for non-existing field")
	}

	isError := form.Errors.Get("x")
	if isError == "" {
		t.Error("should have an error, but did not get one")
	}

	postedData := url.Values{}
	postedData.Add("some_field", "some value")
	form = New(postedData)

	form.MinLength("some_field", 100)
	if form.Valid() {
		t.Error("shows min length of 100 met when data is shorter")
	}

	postedData = url.Values{}
	postedData.Add("another_field", "asd")
	form = New(postedData)

	form.MinLength("another_field", 1)
	if !form.Valid() {
		t.Error("shows min length of 1 not met")
	}

	isError = form.Errors.Get("another_field")
	if isError != "" {
		t.Error("should not have an error, but get one")
	}
}

func TestForm_IsEmail(t *testing.T) {
	postedData := url.Values{}
	form := New(postedData)

	form.IsEmail("x")
	if form.Valid() {
		t.Error("form show error for none existing field")
	}

	postedData = url.Values{}
	postedData.Add("email", "test@test.com")
	form = New(postedData)

	form.IsEmail("email")
	if !form.Valid() {
		t.Error("got an invalid email when should not have")
	}

	postedData = url.Values{}
	postedData.Add("some_email", "x")
	form = New(postedData)

	form.IsEmail("some_email")
	if form.Valid() {
		t.Error("got valid for invalid email address")
	}
}
