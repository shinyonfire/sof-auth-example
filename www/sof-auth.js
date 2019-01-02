

const config = {
  apiKey: "<your Firebase apiKey>",
  authDomain: "<your Firebase auth domain>",
  projectId: "<your Firebase projectId>"
}

firebase.initializeApp(config)

const auth = firebase.auth()

$(document).on("click", "#submit_sign_in", () => {
  const email = $("#email").val()
  const password = $("#password").val()

  auth.signInWithEmailAndPassword(email, password)
  .catch((error) => {
    showSnackbar("sign_in_snackbar", "Error: " + error.message)
    console.log("sign in error: ", error)
  })
})



$(document).on("click", "#submit_sign_out", () => {
  auth.signOut()
  .catch((error) => {
    console.log("Sign Out Error", error)
  })
})

$(document).on("click", "#verify_email_submit_sign_out", () => {
  auth.signOut()
  .catch((error) => {
    console.log("Sign Out Error", error)
  })
})

auth.onAuthStateChanged((user) => {
  // when user signs in or out send the info about that user to Shiny as
  // a Shiny input `input$sof_auth_user`
  Shiny.setInputValue('sof_auth_user', user);
})

$(document).on("click", "#resend_email_verification", () => {

  const user = auth.currentUser

  user.sendEmailVerification()
  .then(() => {
    showSnackbar("verify_email_snackbar", "verification email send to " + user.email)
  })
  .catch((error) => {
    showSnackbar("verify_email_snackbar", "Error: " + error.message)
    console.error('error sending email verification', error)
  })
})



$(document).on("click", "#submit_register", () => {

  const email = $("#register_email").val()
  const password = $("#register_password").val()
  const password_2 = $("#register_password_verify").val()
  console.log(
    "submit_register",
    email,
    password,
    password_2
  )
  if (password === password_2) {
    auth.createUserWithEmailAndPassword(email, password).then((user) => {

      user.user.sendEmailVerification()
      .catch((error) => {
        showSnackbar("register_snackbar", "Error: " + error.message)
        console.log("error sending email verification: ", error)
      })

    })
    .catch((error) => {
      showSnackbar("register_snackbar", "Error: " + error.message)
    })

  } else {
    showSnackbar("register_snackbar", "Error: the passwords do not match")
  }
})

$(document).on("click", "#reset_password", () => {
  const email = $("#email").val()

  console.log("reset password ran")
  auth.sendPasswordResetEmail(email).then(() => {
    showSnackbar("sign_in_snackbar", "Reset email sent to " + email)
  }).catch((error) => {
    showSnackbar("sign_in_snackbar", "Error: " + error.message)
    console.log("error resetting email: ", error)

  })
})
