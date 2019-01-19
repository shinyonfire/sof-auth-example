function(input, output, session) {

  ##### Switch Views ------------------
  # if user click link to register, go to register view
  observeEvent(input$go_to_register, {
    shinyjs::show("register_panel", anim = TRUE, animType = "fade")
    shinyjs::hide("sign_in_panel")
    shinyjs::hide("not_authorized")
  }, ignoreInit = TRUE)

  observeEvent(input$go_to_sign_in, {
    shinyjs::hide("register_panel")
    shinyjs::hide("not_authorized")
    shinyjs::show("sign_in_panel", anim = TRUE, animType = "fade")
  }, ignoreInit = TRUE)

  # switch between auth sign in/registration and app for signed in user
  observeEvent(session$userData$current_user(), {
    current_user <- session$userData$current_user()

    if (is.null(current_user)) {
      shinyjs::show("sign_in_panel")
      shinyjs::hide("main")
      shinyjs::hide("verify_email_view")
      shinyjs::hide("not_authorized")
    } else {
      shinyjs::hide("sign_in_panel")
      shinyjs::hide("register_panel")
      shinyjs::hide("not_authorized")

      if (current_user$emailVerified == TRUE) {
        
        # read the email of the authenticated user
        res1 <- signed_in_user_df()
        email_logged <- res1$value[res1$name == "email"]
        
        # check if the email of the authenticated user is in auth_users
        if (email_logged %in% auth_users$useremail){
          shinyjs::show("main")
        } else {
          shinyjs::show("not_authorized")
        }
        
      } else {
        shinyjs::show("verify_email_view")
      }

    }

  }, ignoreNULL = FALSE)




  # Signed in user --------------------
  # the `session$userData$current_user()` reactiveVal will hold information about the user
  # that has signed in through Firebase.  A value of NULL will be used if the user is not
  # signed in
  session$userData$current_user <- reactiveVal(NULL)

  # input$sof_auth_user comes from front end js in "www/sof-auth.js"
  observeEvent(input$sof_auth_user, {

    # set the signed in user
    session$userData$current_user(input$sof_auth_user)

  }, ignoreNULL = FALSE)



  ##### App for signed in user
  signed_in_user_df <- reactive({
    req(session$userData$current_user())

    out <- session$userData$current_user()
    out <- unlist(out)

    data.frame(
      name = names(out),
      value = unname(out)
    )
  })


  output$user_out <- DT::renderDT({
    datatable(
      signed_in_user_df(),
      rownames = FALSE,
      options = list(
        dom = "tp",
        scrollX = TRUE
      )
    )
  })

}
