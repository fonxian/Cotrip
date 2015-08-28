var clicked;

function login()
{
  if (clicked) {
    return false;
  }
  var name = $('name').value;
  var password = $('password').value;
  if (name == '') {
    alert('You should type your user name');
    $('name').focus();
    return false;
  }
  if (password == '') {
    alert('You should type your password');
    $('password').focus();
    return false;
  }
  report('Information submitted, please wait...',10000);
  clicked = true;
  setTimeout('clicked=false;',10000);
  return true;
}

var blinks = 0;
function hideWarning()
{
  if (! $('warning')) {
    return;
  }
  if (blinks > 4) {
    $('warning').className = null;
    return;
  }

  blinks++;
  $('warning').style.visibility = 'hidden';
  setTimeout('showWarning()',300);
}

function showWarning()
{
  $('warning').style.visibility = 'visible';
  setTimeout('hideWarning()',1200);
}

var shift = 0;
var interval = 100;
var ad;
var moves = 0;
function activateAd()
{
  ad = $('ad');
  if (! ad) {
    return;
  }
  setTimeout('moveAd()',interval);
}

function moveAd()
{
  shift++;
  if (shift > 50) {
    shift = 0;
    moves++;
  }
  ad.style.paddingLeft = shift + 'pt';
  if (moves < 2) {
    setTimeout('moveAd()',interval);
  }
}

addOnLoad(
  function(){
    clicked = false;
    clearReport();
    $('password').value = '';
    $('name').focus();
  }
);
addOnLoad(hideWarning);
// addOnLoad(activateAd);
