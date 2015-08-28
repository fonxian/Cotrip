var submitted;

function step2()
{
  try {
    if (submitted) {
      return;
    }
    submitted = true;
    var form = $('aform');
    var err = new Err;
    err.mandatory(form.surname.value,'last name');
    err.checkEmail(form.email.value,true);
    if (err.checkAndAlert()) {
      submitted = false;
      return true;
    }
    submitted = false;
    return false;
  }
  catch (err) {
    logError(err,'signup.step2');
  }
}
