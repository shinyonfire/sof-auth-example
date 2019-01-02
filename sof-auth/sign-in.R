div(
  id = "sign_in_panel",
  class = "auth_panel",
  h1(
    class = "text-center",
    style = "padding-top: 0;",
    "Sign In"
  ),
  br(),
  div(
    class = "form-group",
    style = "width: 100%",
    tags$label(
      tagList(icon("envelope"), "email"),
      `for` = "email"
    ),
    tags$input(
      id = "email",
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
      `for` = "password"
    ),
    tags$input(
      id = "password",
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
      id = "submit_sign_in",
      style = "color: white; width: 100%;",
      type = "button",
      class = "btn btn-primary btn-lg",
      "Sign In"
    ),
    br(),
    hr(),
    br(),
    actionLink(
      "go_to_register",
      "Not a member? Register!"
    ),
    br(),
    br(),
    tags$a(
      id = "reset_password",
      href = "#",
      "Forgot your password?"
    )
  ),
  div(
    id = "sign_in_snackbar",
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
)