{{define "base"}}
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Document</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vanillajs-datepicker@1.2.0/dist/css/datepicker.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vanillajs-datepicker@1.2.0/dist/css/datepicker-bs5.min.css">
  <link rel="stylesheet" type="text/css" href="https://unpkg.com/notie/dist/notie.min.css">
  <link rel="stylesheet" type="text/css" href="sweetalert2.min.css">

  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <link rel="stylesheet" type="text/css" href="/static/css/styles.css">

  {{block "css" .}}
  {{end}}
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="/">Navbar</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/about">About</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="/" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">
              Rooms
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="/generals-quarters">General's Quarters</a></li>
              <li><a class="dropdown-item" href="/majors-suite">Major's Suite</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link" tabindex="-1" href="/search-availability">Book Now</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" tabindex="-1" href="/contact">Contact</a>
          </li>
        </ul>

        {{/* <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form> */}}
      </div>
    </div>
  </nav>

  {{block "content" .}}
  {{end}}


  <div class="row my-footer">
    <div class="col">
      Left
    </div>
    <div class="col">
      Middle
    </div>
    <div class="col">
      Right
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
    integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/vanillajs-datepicker@1.2.0/dist/js/datepicker-full.min.js"></script>
  <script src="https://unpkg.com/notie"></script>
  <script src="sweetalert2.all.min.js"></script>

  <script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
      'use strict'

      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      const forms = document.querySelectorAll('.needs-validation');

      // Loop over them and prevent submission
      Array.from(forms)
        .forEach(function(form) {
          form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
              event.preventDefault();
              event.stopPropagation();
            }

            form.classList.add('was-validated');
          }, false);
        });
    })();
  </script>


  <script>
    let attention = Prompt();


    function notify(message, messageType) {
      notie.alert({
        type: messageType, // optional, default = 4, enum: [1, 2, 3, 4, 5, 'success', 'warning', 'error', 'info', 'neutral']
        text: message,
      });
    }

    function notifyModal(title, text, icon, confirmButtonText) {
      Swal.fire({
        title,
        html: text,
        icon,
        confirmButtonText
      })
    }

    {{with .Flash}}
    notify("{{.}}", "flash")
    {{end}}
    {{with .Warning}}
    notify("{{.}}", "warning")
    {{end}}
    {{with .Error}}
    notify("{{.}}", "error")
    {{end}}

    function Prompt() {
      const toast = function(options) {
        const {
          message = "",
          icon = "success",
          position = "top-end",
        } = options;

        const Toast = Swal.mixin({
          toast: true,
          position,
          icon,
          title: message,
          showConfirmButton: false,
          timer: 3000,
          timerProgressBar: true,

          didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
          },
        });

        Toast.fire();
      }
      const success = function(options) {
        const {
          title = "",
          message = "",
          footer = "",
        } = options;

        Swal.fire({
          title,
          footer,
          text: message,
          icon: 'success',
        });
      }
      const error = function(options) {
        const {
          title = "",
          message = "",
          footer = "",
        } = options;

        Swal.fire({
          title,
          footer,
          text: message,
          icon: 'error',
        });
      }
      async function custom(options) {
        const {
          message = "",
          title = "",
        } = options;


        const { value: formValues } = await Swal.fire({
          title,
          html: message,
          backdrop: false,
          focusConfirm: false,
          showCancelButton: true,
          willOpen: () => {
            if (options.willOpen !== undefined) {
              options.willOpen();
            }
          },
          didOpen: () => {
            if (options.didOpen !== undefined) {
              options.didOpen();
            }
          },
          preConfirm: () => {
            return [
              document.getElementById('start-date-modal').value,
              document.getElementById('end-date-modal').value
            ]
          },
        });

        if (formValues && options.callback !== undefined) {
          if (formValues.dismiss !== Swal.DismissReason.cancel) {
            if (formValues.value !== "") {
              // if (options.callback !== undefined) {
              options.callback(formValues);
              // }
            } else {
              options.callback(false);
            }
          } else {
            options.callback(false);
          }
        }
      }

      return {
        toast,
        success,
        error,
        custom,
      }
    }
  </script>


  {{block "js" .}}
  {{end}}

</body>

</html>
{{end}}