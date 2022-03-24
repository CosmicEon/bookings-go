{{template "base" .}}

{{define "content"}}
<div class="container">
  <div class="row">
    <div class="col">
      <h1>This is the about page</h1>
      <p>some other text</p>

      <p>
        {{if ne (index .StringMap "remote_ip") ""}}
        Your remote IP adress is {{index .StringMap "remote_ip"}}
        {{else}}
        I don't know your IP adress yet. Visit the <a href="/">Home page</a> to be stored.
        {{end}}
      </p>
    </div>
  </div>
</div>
{{end}}