{{template "base" .}}

{{define "content"}}

<div class="container">
  <div class="row">
    <div class="col">
      <img src="/static/images/generals-quarters.png" class="img-fluid mx-auto img-thumbnail d-block room-image"
        alt="room image">
    </div>
  </div>

  <div class="row">
    <div class="col">
      <h1 class="text-center mt-4">General's Quarters</h1>
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
  const csrf_token = "{{.CSRFToken}}";
  RoomAvailabilityPrompt(csrf_token, "1");
</script>
{{end}}