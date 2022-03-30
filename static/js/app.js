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
      icon = "",
      message = "",
      title = "",
      showConfirmButton = true,
    } = options;


    const { value: formValues } = await Swal.fire({
      title,
      icon,
      html: message,
      backdrop: false,
      focusConfirm: false,
      showCancelButton: true,
      showConfirmButton,
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
        options.preConfirm();
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


function RoomAvailabilityPrompt(CSRFToken, roomId) {
  document.getElementById("check-availability-id").addEventListener("click", function() {
    let form;
    let html = `
      <form id="check-availability-form" class="needs-validation" action="/reservation" method="GET" novalidate>
        <div id="reservation-dates-modal" class="row">
          <div class="col">
            <input type="text" name="start_date" id="start-date-modal" class="form-control" placeholder="Arrival date" autocomplete="off" required disabled>
          </div>
          <div class="col">
            <input type="text" name="end_date" id="end-date-modal" class="form-control" placeholder="Departure date" autocomplete="off" required disabled>
          </div>
        </div>
      </form>
    `
    attention.custom({
      message: html,
      title: "Chose your dates",
      willOpen: () => {
        const elem = document.getElementById("reservation-dates-modal");
        new DateRangePicker(elem, {
          format: "yyyy-mm-dd",
          showOnFocus: true,
          minDate: new Date(),
        });
      },
      didOpen: () => {
        document.getElementById('start-date-modal').removeAttribute("disabled");
        document.getElementById('end-date-modal').removeAttribute("disabled");
      },
      preConfirm: () => {
        form = document.getElementById("check-availability-form");
      },
      callback: (result) => {
        const formData = new FormData(form);
        formData.append("csrf_token", CSRFToken);
        formData.append("room_id", roomId);

        fetch("/search-availability-json", {
          method: "POST",
          body: formData,
        })
          .then(response => response.json())
          .then(data => {
            if (data.ok) {
              attention.custom({
                icon: 'success',
                message: `<p>Room is available</p>
                  <p><a href="/book-room?id=${data.room_id}&sd=${data.start_date}&ed=${data.end_date}" class="btn btn=primary">
                  Book now!</a></p>`,
                showConfirmButton: false,
              });
            } else {
              attention.error({
                message: "No availability"
              });
            }
          });
      }
    });
  });
}