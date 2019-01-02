fluidPage(
  shiny::singleton(
    shiny::tags$head(
      tags$link(rel = "stylesheet", href = "styles.css"),
      tags$link(rel = "stylesheet", href = "snackbar.css"),
      tags$script(src="snackbar.js"),
      tags$script(src="https://www.gstatic.com/firebasejs/5.7.0/firebase-app.js"),
      tags$script(src="https://www.gstatic.com/firebasejs/5.7.0/firebase-auth.js"),
      shiny::tags$script(src="sof-auth.js")
    )
  ),

  # load shinyjs on
  shinyjs::useShinyjs(),

  source("sof-auth/sign-in.R", local = TRUE)$value,
  source("sof-auth/register.R", local = TRUE)$value,
  source("sof-auth/verify-email.R", local = TRUE)$value,

  source("ui/main.R", local = TRUE)$value
)
