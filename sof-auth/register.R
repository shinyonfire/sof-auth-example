hidden(div(
  id = "register_panel",
  class = "auth_panel",
  h1(
    class = "text-center",
    style = "padding-top: 0;",
    "Register"
  ),
  br(),
  div(
    class = "form-group",
    style = "width: 100%",
    tags$label(
      tagList(icon("envelope"), "email"),
      `for` = "register_email"
    ),
    tags$input(
      id = "register_email",
      type = "text",
      class = "form-control",
      value = ""
    )
  ),
  br(),
  div(
    class = "form-group",
    style = "width: 100%",
    tags$label(
      tagList(icon("unlock-alt"), "password"),
      `for` = "register_password"
    ),
    tags$input(
      id = "register_password",
      type = "password",
      class = "form-control",
      value = "",
      placeholder = "**********"
    )
  ),
  br(),
  div(
    class = "form-group shiny-input-container",
    style = "width: 100%",
    tags$label(
      tagList(icon("unlock-alt"), "verify password"),
      `for` = "register_password_verify"
    ),
    tags$input(
      id = "register_password_verify",
      type = "password",
      class = "form-control",
      value = "",
      placeholder = "**********"
    )
  ),
  br(),
  br(),
  div(
    style = "text-align: center;",
    tags$button(
      id = "submit_register",
      style = "color: white; width: 100%;",
      type = "button",
      class = "btn btn-primary btn-lg",
      "Register"
    ),
    br(),
    hr(),
    br(),
    actionLink(
      "go_to_sign_in",
      "Already a member? Sign in!"
    ),
    br(),
    br()
  ),
  div(
    id = "register_snackbar",
    class = "snackbar",
    span(class = "snack_text"),
    tags$span(
      id = "sign_in_snackbar_remove_btn",
      style = "float: right; margin-left: 20px; cursor: pointer;",
      tags$i(
        class = "fa fa-times",
        `aria-hidden` = "true"
      )
    )
  )
))