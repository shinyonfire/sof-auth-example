hidden(div(
  id = "verify_email_view",
  fluidRow(
    column(
      12,
      tags$button(
        id = "verify_email_submit_sign_out",
        type = "button",
        "Sign Out",
        class = "btn-danger pull-right",
        style = "color: white;"
      )
    )
  ),
  fluidRow(
    class = "text-center",
    style = "margin: 0 auto; padding-top: 100px;",
    column(
      8,
      offset = 2,
      h1("Thank you for registering!"),
      br(),
      h2(
        style = "line-height: 2",
        "We just sent you a verification email.  Please check your email and come back!"
      ),
      br(),
      h3("Didn't receive the verification email?"),
      tags$button(
        id = "resend_email_verification",
        class = "btn btn-default",
        "Resend Verification Email"
      )
    )
  ),
  div(
    id = "verify_email_snackbar",
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
