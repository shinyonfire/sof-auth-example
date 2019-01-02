hidden(fluidRow(
  id = "main",
  column(
    12,
    tags$button(
      id = "submit_sign_out",
      type = "button",
      "Sign Out",
      class = "btn-danger pull-right",
      style = "color: white;"
    )
  ),
  column(
    12,
    div(
      style = "padding: 50px",
      h1("You and now signed in and your email address has been verified!"),
      br(),
      br(),
      h3("This is all the information that comes with the signed in user with 'Email/Password' authentication on Firebase"),

      DT::DTOutput("user_out")
    )
  )
))