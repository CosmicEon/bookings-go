{{template "base" .}}

{{define "content"}}

<div class="container">
  <div class="row">
    <div class="col">
      <img src="/static/images/majors-suite.png" class="img-fluid mx-auto img-thumbnail d-block room-image"
        alt="room image">
    </div>
  </div>

  <div class="row">
    <div class="col">
      <h1 class="text-center mt-4">Major's Suite</h1>
      <p>Your home away from home, set on the majestic waters of the Atlantic Ocean, this will be a vacation to
        remember.
      </p>

      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde reiciendis a optio accusamus magnam alias
        accusantium sit dignissimos? Eos fugit error, voluptatibus nam rerum impedit autem ea nobis illo alias hic?
        Consectetur officiis, sunt dignissimos assumenda quae, laborum reiciendis consequatur temporibus doloribus
        excepturi totam nisi placeat fuga eaque iure dolorem.</p>

      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde reiciendis a optio accusamus magnam alias
        accusantium sit dignissimos? Eos fugit error, voluptatibus nam rerum impedit autem ea nobis illo alias hic?
        Consectetur officiis, sunt dignissimos assumenda quae, laborum reiciendis consequatur temporibus doloribus
        excepturi totam nisi placeat fuga eaque iure dolorem.</p>
    </div>
  </div>

  <dir class="row">
    <div class="col text-center">
      <a href="#!" id="check-availability-id" class="btn btn-success">Check Availability</a>
    </div>
  </dir>
</div>

{{end}}

{{define "js"}}
<script>

    document.getElementById("check-availability-id").addEventListener("click", function() {
      let html = `
      <form if="check-availability-form" class="needs-validation" action="/reservation" method="GET" novalidate>
        <div id="reservation-dates-modal" class="row">
          <div class="col">
            <input type="text" name="start_date" id="start-date-modal" class="form-control" placeholder="Arrival date" required disabled>
          </div>
          <div class="col">
            <input type="text" name="end_date" id="end-date-modal" class="form-control" placeholder="Departure date" required disabled>
          </div>
        </div>
      </form>
    `
      attention.custom({ message: html });
    });
</script>
{{end}}