hidden(div(
  id = "not_authorized",
  fluidRow(
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
      h1("You are not authorized to use this app."),
      br(),
      p("Please contact your administrator.")
    )
  )
)
)
