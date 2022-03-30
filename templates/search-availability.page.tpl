{{template "base" .}}

{{define "content"}}

<div class="container">
  <h1 class="md-5 text-center">Search for Availability</h1>

  <div class="row">
    <div class="col-3"></div>

    <div class="col-6">
      <form action="/search-availability" method="post" class="needs-validation" novalidate>
        <input type="hidden" name="csrf_token" value="{{.CSRFToken}}">

        <div id="reservation-dates" class="row">
          <div class="col">
            <input type="text" name="start_date" class="form-control" placeholder="Arrival date" required>
          </div>
          <div class="col">
            <input type="text" name="end_date" class="form-control" placeholder="Departure date" required>
          </div>
        </div>

        <hr>

        <button type="submit" class="btn btn-primary" id="search-button">Search Availability</button>
      </form>
    </div>
  </div>
</div>

<div class="row">
  <div class="col">
    <p id="myParagraph"></p>
  </div>
</div>

{{end}}

{{define "js"}}
<script>
  const elem = document.getElementById('reservation-dates');
  new DateRangePicker(elem, {
    format: "yyyy-mm-dd",
    minDate: new Date(),
  });

</script>
{{end}}