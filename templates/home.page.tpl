{{template "base" .}}

{{define "content"}}
<div id="main-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#main-carousel" data-bs-slide-to="0" class="active" aria-current="true"
      aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#main-carousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#main-carousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>

  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/static/images/woman-laptop.png" class="d-block w-100" alt="Woman and laptop">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>

    <div class="carousel-item">
      <img src="/static/images/tray.png" class="d-block w-100" alt="Tray with coffee">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>

    <div class="carousel-item">
      <img src="/static/images/outside.png" class="d-block w-100" alt="Outside">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <div class="row">
    <div class="col">
      <h1 class="text-center mt-4">Welcome to Fort Smyth Bed and Breakfast</h1>
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
      <a href="/search-availability" class="btn btn-success">Make Reservation Now</a>
    </div>
  </dir>
</div>

{{end}}