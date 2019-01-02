const showSnackbar = (id, message, autoHideDuration) => {
  // set autoHideDuration to 4 seconds if it is not set in paramter
  autoHideDuration = autoHideDuration || 4000

  // Get the snackbar DIV
  var snackEl = $("#" + id);
  var snackText = $("#" + id + " .snack_text");

  snackText.text(message);

  // Add the "show" class to snackbar DIV
  snackEl.fadeIn("slow");


  // After 4 seconds, remove the show class from DIV
  if (autoHideDuration !== null) {
    setTimeout(function() {
      snackEl.fadeOut("slow");
      // reset the snackbar message to nothing
      snackEl.innerHTML = "";
    }, autoHideDuration);
  }


  var removeBtn = $("#" + id + "_remove_btn");

  removeBtn.click(function() {
    snackEl.fadeOut("slow");
  });
}

