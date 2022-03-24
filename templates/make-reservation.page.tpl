{{template "base" .}}

{{define "content"}}

<div class="container">
  <div class="row">
    <div class="col">
      <h1>Make reservation</h1>

      {{$res := index .Data "reservation"}}
      <form action="" method="POST" class="" novalidate>
        <input type="hidden" name="csrf_token" value="{{.CSRFToken}}">

        <div class="row">
          <div class="col mt-5">
            <label for="first_name">First Name:</label>
            {{with .Form.Errors.Get "first_name"}}
            <label class="text-danger">{{.}}</label>
            {{end}}
            <input id="first_name {{with .Form.Errors.Get " first_name"}} is-invalid {{end}}" class="form-control"
              type="text" name="first_name" autocomplete="off" value="{{$res.FirstName}}" required>
          </div>
        </div>

        <div class="row">
          <div class="col">
            <label for="last_name">Last Name:</label>
            {{with .Form.Errors.Get "last_name"}}
            <label class="text-danger">{{.}}</label>
            {{end}}
            <input id="last_name {{with .Form.Errors.Get " last_name"}} is-invalid {{end}}" class="form-control"
              type="text" name="last_name" autocomplete="off" value="{{$res.LastName}}" required>
          </div>
        </div>

        <div class="row">
          <div class="col">
            <label for="email">Email:</label>
            {{with .Form.Errors.Get "email"}}
            <label class="text-danger">{{.}}</label>
            {{end}}
            <input id="email {{with .Form.Errors.Get " email"}} is-invalid {{end}}" class="form-control" type="email"
              name="email" autocomplete="off" value="{{$res.Email}}" required>
          </div>
        </div>

        <div class="row">
          <div class="col">
            <label for="phone">Phone:</label>
            {{with .Form.Errors.Get "phone"}}
            <label class="text-danger">{{.}}</label>
            {{end}}
            <input id="phone {{with .Form.Errors.Get " phone"}} is-invalid {{end}}" class="form-control" type="phone"
              name="phone" autocomplete="off" value="{{$res.Phone}}" required>
          </div>
        </div>

        <hr>

        <button type="submit" class="btn btn-primary">Make Reservation</button>
      </form>
    </div>
  </div>
</div>

{{end}}