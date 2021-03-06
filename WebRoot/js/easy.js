// (c) 2007-2009 Andrei Voronkov
// (c) 2010-2012 easychair.org

/**
 * Variable representing the global state
 * It is the hash storing the following values passed by the server-side script:
 *
 *  proxy       : same if $PROXY
 *  role        : same as $COOL{'role'}
 *  track       : same as $ID
 *  demo        : same as $DEMO
 *  chair       : same as $CHAIR
 *  inc         : same as $COOL{'code'}
 *  superchair  : same as $SUPER
 *  hasTracks   : same as $HAS_TRACKS
 *  pid         : same as $PID
 *  attachmentMandatory : computed by conference configuration (server side)
 *  browser     : computed by this script (client-side)
 *  
*/
var cool = {};
// any false value for the debugging info
window.debug = 0;

function doNothing() {}

// machine-independent analogues of addEventListener, stopPropagation,
// and preventDefault
if (document.addEventListener) { // DOM 2.0
  addEventHandler = function(element,event,handler) {
    element.addEventListener(event,handler,false);
  }
  cancelPropagation = function(event) {
    event.stopPropagation();
  }
  cancelDefault = function(event) {
    event.preventDefault();
  }
}
else if (document.attachEvent) { // IE
  addEventHandler = function(element,event,handler) {
    element.attachEvent('on'+event,handler);
  }
  cancelPropagation = function(event) {
    event = event || window.event;
    event.cancelBubble = true;
  }
  cancelDefault = function(event) {
    event = event || window.event;
    event.returnValue = false;
  }
}
else { // ancient DOM
  // adding events to browsers not supporting addEventListener or attachEvent
  var MyHandler = {
    all : [],

    add : function (element,event,handler)
    {
      for (var e = MyHandler.all.length-1;e >= 0;e--) {
	var eh = MyHandler.all[e];
	if (eh[0] == element) { // there were previous handlers for this element
	  var handlers = eh[1];
	  var hlist = handlers[event];
	  if (hlist) { // there are already handlers for this event and element
	    // check if this handler is already on the list
	    for (var j = hlist.length-1;j >= 0;j--) {
	      if (hlist[j] == handler) {
		return;
	      }
	    }
	    hlist.push(handler);
	    return;
	  }
	  // there are no handlers for this event and element added by MyHandler
	  hlist = element[event] ? [element[event],handler] : [handler];
	  handlers[event] = hlist;
	  element[event] = function(ev) {MyHandler.iterate(ev,hlist);};
	  return;
	}
      }
      var hlist = element[event] ? [element[event],handler] : [handler];
      MyHandler.all.push([element,{event:hlist}]);
      element[event] = function(ev) {MyHandler.iterate(ev,hlist);};
    },

    // the "onevent" function, applies all event handlers from the list attached to this element until one of them returns true
    iterate : function(event,hlist)
    {
      for (var i = 0;i < hlist.length;i++) {
	if (hlist[i](event)) return true;
      }
      return false;
    }
  }; // MyHandler
  addEventHandler = function(element,event,handler) {
    MyHandler.add(element,'on'+event,handler);
  }
  cancelPropagation = function() {}
  cancelDefault = function() {}
}

// ******* adding window.onload functions ********

function addOnLoad(f)
{
  addEventHandler(window,'load',f);
}

// ******* adding window.onunload functions ********

function addOnUnload(f)
{
  addEventHandler(window,'unload',f);
}

// ************** functions for protecting from double-clicks ***************
// protect buttons from double-clicking
// If either delay is undefined or delay is a positive integer
// and the button is doublick-click after
// delay or more milliseconds, then the user will be alert
function protectButton(id,delay)
{
  try {
    if (keys(protectButton.buttons).length == 0) { 
      addOnLoad(protectButton.start);
      addOnUnload(function() {protectButton.clicked = {};});
    }
    protectButton.buttons[id] = delay;
  }
  catch (err) {
    logError(err,'easy.protectButton');
  }
} // protectButton

// maps protected buttons ids to delays
protectButton.buttons = {};
// maps clicked buttons to 1
protectButton.clicked = {};

// onload function called when there is at least one protected button
protectButton.start = function()
{
  try {
    for (var id in protectButton.buttons) {
      var button = $(id);
      if (button) {
	button.onclick = protectButton.click;
      }
    }
  }
  catch (err) {
    logError(err,'easy.protectButton.start');
  }
} // protectButton.start

// onlick function for protected buttons
protectButton.click = function(event)
{
  try {
    var button = eventSource(event,'id');
    if (! button) {
      return true;
    }
    var clicked = protectButton.clicked;
    var whenClicked = clicked[button.id];
    if (whenClicked) {
      var delay = protectButton.buttons[button.id];
      if (! delay || new Date().getTime() - whenClicked <= delay) {
	cancelDefault(event);
	alert('You have already clicked this button!');
	return false;
      }
    }
    clicked[button.id] = new Date().getTime();
    return true;
  }
  catch (err) {
    logError(err,'easy.protectButton.click');
  }
} // protectButton.click

// release protected button so it can be clicked again
protectButton.release = function(id)
{
  try {
    protectButton.clicked[id] = false;
  }
  catch (err) {
    logError(err,'easy.protectButton.release');
  }
} // protectButton.click

// *********** end of functions for protecting from double-clicks ************

// get the browser
function getBrowser() {
  if (cool.browser) {
    return cool.browser;
  }
  var info = navigator.userAgent;
  if (info.indexOf('MSIE ') != -1) {
    cool.browser = 'IE';
  }
  if (info.indexOf('Chrome') != -1) {
    cool.browser = 'Chrome';
  }
  else if (info.indexOf('Firefox/') != -1) {
    cool.browser = 'Firefox';
  }
  else if (info.indexOf('Safari/') != -1) {
    cool.browser = 'Safari';
  }
  else if (info.indexOf('Opera/') != -1) {
    cool.browser = 'Opera';
  }
  else if (info.indexOf('SeaMonkey/') != -1) {
    cool.browser = 'SeaMonkey';
  }
  else if (info.indexOf('Netscape/') != -1) {
    cool.browser = 'Netscape';
  }
  else if (info.indexOf('Camino/') != -1) {
    cool.browser = 'Camino';
  }
  else if (info.indexOf('Konqueror/') != -1) {
    cool.browser = 'Konqueror';
  }
  else if (info.indexOf('BlackBerry') != -1) {
    cool.browser = 'BlackBerry';
  }
  else {
    cool.browser = 'unknown';
  }
  return cool.browser;
} // getBrowser

// true if str is a whitespace-only string
function whiteSpace (str) {
  return str.search(/\S/) == -1;
} // whiteSpace

// trim string from spaces on both sides
function trim (str) {
  if (str == undefined) {
    return str;
  }
  str = str.replace(/^\s*/,'');
  str = str.replace(/\s*$/,'');
  return str;
} // trim

// true if x is a member of xs
function member (x,xs) {
  for (var i = xs.length-1;i >= 0;i--) {
    if (xs[i] == x) {
      return true;
    }
  }
  return false;
} // member

// validEmailAddress($address)
//   very simple check on the validity of email $address: it should be
//   of the form __@__.__, where @ occurs only once and whatever
//   follows '.' has at least two alphanumeric characters
function validEmailAddress (address)
{
  address = trim(address);
  if (address.match(/@.*@/)) { // two '@' 
    return false;
  }
  if (address.match(/\.\./)) { // contains '..'
    return false;
  }
  if (address.match(/@\./)) { // contains '@.'
    return false;
  }
  if (address.match(/\s/)) { // contains a space
    return false;
  }
  if (address.match(/\,/)) { // contains ','
    return false;
  }
  if (address.match(/\</)) { // contains '<'
    return false;
  }
  if (address.match(/\>/)) { // contains '>'
    return false;
  }
  if (address.match(/\;/)) { // contains ';'
    return false;
  }
  var m = address.match(/^(.+)@(.+)\.([^\.]+)$/);
  if (m == null) {
    return false;
  }
  var domain = m[3];
  // all non-white, at least two characters
  if (! domain.match(/^\S\S+$/)) {
    return false;
  }
  return true;
} // validEmailAddress


// validDemoAddress($address)
//   is an address of the form <name>@demo.easychair.org having
//   at least 6 symbols in the name part
function validDemoAddress (address)
{
  address = trim(address);
  var m = address.match(/^(.+)@demo.easychair\.org$/);
  if (m == null) {
    return false;
  }
  var prefix = m[1];
  if (prefix.length < 6) {
    return false;
  }
  return true;
} // validDemoAddress


// true if the NodeList lst has at least one checked element
function hasChecked (lst) {
  for (var n=0;n < lst.length;n++) {
    if (lst[n].checked) {
      return true;
    }
  }
  return false;
} // hasChecked

// constructor of errors
function Err() {
  this.errors = [];
} // Err

Err.prototype = {
  add : function (msg) {
    this.errors.push(msg);
  },

  addFirst : function (msg) {
    this.errors.unshift(msg);
  },

  // add a list of errors
  addList : function (lst) {
    for (var i = 0;i < lst.length;i++) {
      this.errors.push(lst[i]);
    }
  },

  reset : function () {
    this.errors = [];
  },

  hasErrors : function () {
    return (this.errors.length > 0);
  },

  // If the email address is incorrect, add a corresponding error.
  // If mandatory is true, the address is mandatory
  // return true if no error
  checkEmail : function (address,mandatory,what)
  {
    address = trim(address);
    if (address == '') {
      if (mandatory) {
	what = what || 'email address';
	this.add(what + ' must be specified');
	return false;
      }
      return true;
    }
    if (!validEmailAddress(address)) {
      this.add(address + ' is not a valid email address');
      return false;
    }
    return true;
  }, // Err.checkEmail

  // checkDate(dateString)
  //   parse dateString of the form 2006-14-05.
  //   If any error is encountered, save it and return false. Otherwise
  // return the Date object corresponding to the date. If there is no
  // date but the date is optional return true
  checkDate : function(dateString,field,optional)
  {
    dateString = trim(dateString);
    if (dateString == '') {
      if (optional) {
	return true;
      }
      this.add(field + ' must be specified');
      return false;
    }

    var parse = dateString.match(/^\s*(\d\d\d\d)-(\d\d)-(\d\d)\s*$/);
    if (! parse) {
      this.add(field + ': ' + dateString + ' is not a correct date');
      return false;
    }

    var year = Number(parse[1]);
    var month = Number(parse[2]);
    var day = Number(parse[3]);
    var errFound;
    if (year < 2000 || year > 2100) {
      this.add(field + ': year out of range');
      errFound = true;
    }

    if (month < 1 || month > 12) {
      this.add(field + ': month out of range');
      errFound = true;
    }

    if (day < 1 || day > 31) {
      this.add(field + ': month out of range');
      errFound = true;
    }

    if (errFound) {
      return false;
    }

    month--;
    var date = new Date(year,month,day);
    if (date.getFullYear() != year ||
	date.getMonth() != month ||
	date.getDate() != day) {
      this.add(field + ': invalid date');
      return false;
    }
    return date;
  }, // checkDate

  // If the value is empty, add a corresponding error about the field
  mandatory : function (val,field) {
    if (! val || trim(val) == '') {
      this.add(field + ' must be specified');
      return false;
    }
    return true;
  }, // Err.mandatory

  // input is a select element. Add an error if nothing
  // is selected. illegal is an optional set of value whose
  // selection is also regarded as an error
  selected : function (input,field,illegal) {
    if (input.selectedIndex == -1 ||
	(illegal &&
	 illegal[input.options[input.selectedIndex].value])) {
      this.add(field + ' must be specified');
      return false;
    }
    return true;
  }, // Err.selected

  // If the value is not a true money value xxxx.xx
  // add a corresponding error about the field
  money : function (val,field)
  {
    val = trim(val);
    if (val.match(/^\-?\d+\.\d\d$/) == null) {
      this.add(field + ' has a wrong format');
      return false;
    }
    return true;
  }, // Err.money

  checkURL : function(val,field)
  {
    val = trim(val);
    if (val.match(/https?:\/\/..+\...+/)) {
      return true;
    }
    var msg = field + ' "' + val + '" does not seem to be a valid URL';
    if (! val.match(/https?/)) {
      msg += '\nDo you mean http://' + val + '?';
    }
    this.add(msg);
    return false;
  }, // Err.checkURL

  // If the value is not a positive integer
  // add a corresponding error about the field
  positiveInteger : function (val,field)
  {
    val = trim(val);
    if (val.match(/^[1-9]\d*$/) == null) {
      this.add(field + ' must be a positive integer');
      return false;
    }
    return true;
  }, // Err.positiveInteger

  // check if there is any error in the list errors and alert if any errors
  // are found. Return true if no errors
  checkAndAlert : function()
  {
    var errors = this.errors;

    if (errors.length == 1) {
      var msg =
	"The following error has been found.\n" +
	"______________________________________________\n\n" +
	this.errors[0] + "\n" +
	"______________________________________________\n\n" +
	"Please fix this error and try again.\n";
      alert(msg);
      return false;
    }
    if (errors.length == 0) {
      return true;
    }

    var msg = "The following errors have been found.\n" +
              "______________________________________________\n\n";
    for (var n = 0;n < errors.length;n++) {
      msg += '' + (n + 1) + ". " + errors[n] + "\n";
    }
    msg += "______________________________________________\n\n" +
           "Please fix these errors and try again.\n";
    alert(msg);
    return false;
  } // Err.CheckAndAlert
};

// Corresponds to XLink::state in Perl code
function computeState()
{
  // coolState may be set by a server-side script
  var state = window.coolState || {};
  if (cool.inc) {
    state.a = cool.inc;
  }
  if (cool.proxy) {
    state.x = cool.proxy;
  }
  if (cool.demo) {
    state.d = cool.demo;
  }
  if (cool.spy) {
    state.spy = cool.spy;
  }
  if (cool.role == 'editor' && cool.pid) {
    state.p = cool.pid;
  }

  return state;
} // computeState

// corresponds to XLink::href()
function href(page,params,anchor)
{
  if (! params) {
    params = {};
  }
  var state = computeState();
  for (var key in params) {
    state[key] = params[key];
  }
  if (cool.track && cool.role == 'author' && !state.track) {
    state.track = cool.track;
  }

  var parNumber = 0; // parameter number
  for (var par in state) {
    var val = state[par];
    if (typeof(val) == 'object' && (val instanceof Array)) { // array
      for (var l = 0;l < val.length;l++) {
	var v = val[l];
	page += (parNumber ? ';' : '') + encodeURIComponent(par) + '=' +
                encodeURIComponent(v);
	parNumber++;
      }
    }
    else {
      page += (parNumber ? ';' : '?') + encodeURIComponent(par) + '=' +
              encodeURIComponent(val);
      parNumber++;
    }
  }
  if (anchor) {
    page += '#' + anchor;
  }
  return page;
} // href




// corresponds to XLink::hrefHome()
function hrefHome(page,params,anchor)
{
  return '/' + href(page,params,anchor);
} // hrefHome

// return the position of the browser window within the document
function getWindowPos () {
  if (window.pageYOffset){
    return {y : window.pageYOffset,
	    x : window.pageXOffset};
  }
  if (document.documentElement && document.documentElement.scrollTop) {
    return {y : document.documentElement.scrollTop,
            x : document.documentElement.scrollLeft};
  }
  if (document.body) {
    return {y : document.body.scrollTop,
	    x : document.body.scrollLeft};
  }

  return {y : 0, x : 0};
} // getWindowPos

// The browser window size
function getWindowSize () {
  if (window.innerWidth) {
    return {x : window.innerWidth,
    	    y : window.innerHeight}
  }
  var winElement = document.body.parentElement;
  return {x : winElement.clientWidth,
          y : winElement.clientHeight};
} // getWindowSize

// center elem in the browser window
function centerInWindow (elem) {
  var size = getWindowSize();
  var windowPos = getWindowPos();

  var x = Math.round(size.x/2 - elem.offsetWidth/2) + windowPos.x;
  var y = Math.round(size.y/2 - elem.offsetHeight/2) + windowPos.y;
  if (y < 0) {
    y = 0;
  }
  elem.style.left = x + 'px';
  elem.style.top = getBrowser() == 'IE'
                   ? (getWindowPos().y + 100) + 'px'
                   : y + 'px';
}

function createRequest()
{
  return window.ActiveXObject
         ? new ActiveXObject("Microsoft.XMLHTTP")
         : new XMLHttpRequest();
} // createRequest

// variable to store the last response handled by loadObject
var lastLoadObjectResponse = '000';
function loadObject(script,handler,params,onSpecial)
{
  var url = href(script);
  var request = createRequest();
  request.open('POST',url,true);
  request.onreadystatechange = function () {
    if (request.readyState == 4 && request.status == 200) {
      // this check is not described in textbooks but this happens
      // when a connection is slow that when request.readyState == 4
      // the request itself is still empty
      var response = request.responseText;
      lastLoadObjectResponse = response;
      if (response != '') {
	// second argument for the call to the handler is added for
	// debugging
	var obj = decode(response);
	if (special(obj)) {
	  if (onSpecial) {
	    onSpecial();
	  }
	  return;
	}
	if (handler) {
	  handler(obj,response);
	}
      }
    }
  }
  request.setRequestHeader('Content-Type',
			   'application/x-www-form-urlencoded');
  var parNumber = 0; // parameter number
  var parString = '';
  params = params || {};
  var state = computeState();
  for (var key in state) {
    params[key] = state[key];
  }
  for (var par in params) {
    var val = params[par];
    if (typeof(val) == 'object' && (val instanceof Array)) { // array
      for (var l = 0;l < val.length;l++) {
	var v = val[l];
	parString += (parNumber ? ';' : '') + encodeURIComponent(par) + '=' +
              encodeURIComponent(v);
	parNumber++;
      }
    }
    else { // string
      parString += (parNumber ? ';' : '') + encodeURIComponent(par) + '=' +
            encodeURIComponent(val);
      parNumber++;
    }
  }

  request.send(parString);
} // loadObject

// special(obj)
//   if obj is an object encoding a special response, perform a
//   function corresponding to this response and return true.
//   Otherwise, return false
function special(response)
{
  if (typeof response != "object" || response == null) {
    return false;
  }
  var what = response.special;
  if (! what) {
    return false;
  }
  if (what == 'login_required') {
    location.href = href('/account/signin.cgi');
    return true;
  }
  if (what == 'rewrite') {
    var content = $('content');
    removeChildren(content);
    $_('h2',false,response.title,content);
    var text = $_('p',false,response.text,content);
    if (response['class']) {
      text.className = response['class'];
    }
    return true;
  }

  var errors = response.errors;
  if (errors) {
    stopWaiting();
    var err = new Err();
    for (var i = 0;i < errors.length;i++) {
      err.add(errors[i]);
    }
    err.checkAndAlert();
  }
  else if (response.error) {
    stopWaiting();
    var err = new Err();
    err.add(response.error);
    err.checkAndAlert();
  }
  else if (response.alert) {
    stopWaiting();
    alert(response.alert);
  }
  else if (response.report) {
    report(response.report,response.time);
  }
  else if (response.died) {
    stopWaiting();
    alert('The following system error has occured:\n' +
          '---------------------------------------\n' +
	  response.died + '\n' +
          '---------------------------------------\n' +
	  'System errors are logged and checked on a\n' +
	  'regular basis so you do not have to do\n' +
	  'anything. However, if you believe you are\n' +
	  'in an emergency situation, please contact\n' +
	  'EasyChair developers using the "Help" menu tab.');
  }
  else if (what == 'attack') {
    stopWaiting();
    alert('An error: probably an access violation');
  }
  else if (response.jserror) {
    stopWaiting();
    alert('The following JavaScript error has occured:\n' +
          '---------------------------------------\n' +
	  response.jserror + '\n' +
          '---------------------------------------\n' +
	  'EasyChair logs such errors and we try to\n' +
	  'fix the problem as soon as we can, so you\n' + 
	  'do not have to do anything. However, if\n' +
	  'you believe you are in an emergency situation,\n' +
	  'please contact EasyChair developers using\n' +
	  'the "Help" menu tab.');
  }

  if (response.href) {
    location.href = href(response.href,response.params);
  }
  else if (response.reload) {
    location.replace(href(response.reload,response.params));
  }
  else if (response.sequence) {
    executeSequence(response.sequence);
  }
  return true;
} // special

function executeSequence(sequence)
{
    try {
	for (var s = 0;s < sequence.length;s++) {
	    var action = sequence[s];
	    switch (action.action) {
	    case 'report':
		report(action.text);
		break;
	    case 'alert':
		alert(action.text);
		break;
	    case 'checkbox':
		$(action.id).checked = action.check ? true : false;
		break;
	    case 'value':
		$(action.id).value = action.value;
		break;
	    case 'set':
		window[action.v] = action.value;
		break;
	    case 'html':
		$(action.id).innerHTML = action.html;
		break;
	    case 'reload':
		return location.replace(href(action.script,action.pars));
	    case 'popup':
		Effects.openPopup(action.id);
		break;
	    case 'focus':
		document.getElementById(action.id).focus();
		break;
	    default:
		throw 'Uknown action: ' + action.action;
	    }
	}
	return false;
    }
    catch (err) {
	logError(err,'executeSequence');
    }
} // executeSequence

// the map function, for whatever 
Array.prototype.map = function(fun) {
  var result = [];
  for (var i = this.length-1;i >= 0;i--) {
    result[i] = fun(this[i]);
  }
  return result;
} // Array.map

// the filter function, for whatever 
Array.prototype.filter = function(fun) {
  var result = [];
  for (var i = 0;i < this.length;i++) {
    if (fun(this[i])) {
      result.push(this[i]);
    }
  }
  return result;
} // Array.filter

// the filter function, for whatever 
Array.prototype.iterator = function(reverse) {
    return new Array.Iterator(this,reverse);
} // Array.iterator

function id (x) {return x;}
function $(x) { return document.getElementById(x); }
function $F(x) { return document.getElementById(x).value ; }

var pendingWaiting = '';
var waitingText;
// start the waiting image with the given text before it
// delay is the time after which the image should start showing
function startWaiting (text,delay) {
  if (delay) {
    if (pendingWaiting != '') {
      clearTimeout(pendingWaiting);
    }
    waitingText = text;
    pendingWaiting = setTimeout('startWaiting("+&")',delay);
    return;
  }
  if (text == "+&") {
    text = waitingText;
    pendingWaiting = '';
  }
  var waitingElement = $('easy:waiting');
  if (! waitingElement) { // element not created
    waitingElement = $_('div',{id:'easy:waiting'},false,$('content'),
			{visibility:'hidden',position:'absolute',
			 backgroundColor:'#ffffe0',color:'black',
			 zIndex:1000000,padding:'50px 80px 50px 80px',
			 border:'black ridge 4px'});
    $_('span',{id:'waiting-text'},false,waitingElement,
       {fontSize:'18px',marginRight:'20px'});
    $_('img',{src:'/images/waiting.gif'},false,waitingElement);
  }
  var txt = $('waiting-text');
  removeChildren(txt);
  $T(text,txt);
  centerInWindow(waitingElement);
  waitingElement.style.visibility = 'visible';
} // startWaiting

// terminate the waiting element
function stopWaiting () {
  if (pendingWaiting != '') {
    clearTimeout(pendingWaiting);
    pendingWaiting = '';
  }
  var waitingElement = $('easy:waiting');
  if (!waitingElement) {
    return;
  }
  waitingElement.style.visibility = 'hidden';
} // stopWaiting

// return a new element possibly with some attributes and possible
// html (e.g., text) inside and append it to appendTo. Add style
// values from the object style.
function $_(tag,attributes,html,appendTo,style)
{
  var elem = document.createElement(tag);
  if (attributes) {
    for (var att in attributes) {
      elem[att] = attributes[att];
    }
  }
  if (html) {
    elem.innerHTML = html;
  }
  if (style) {
    var stl = elem.style;
    for (var key in style) {
      stl[key] = style[key];
    }
  }
  if (appendTo) {
    appendTo.appendChild(elem);
  }
  return elem;
} // $_

// $T(text,[parent])
//   create a text node and append it to parent (if any)
function $T(text,parent)
{
  var node = document.createTextNode(text);
  if (parent) {
    parent.appendChild(node);
  }
  return node;
} // $T

// insert an element after a node
function insertAfter(node,elem)
{
  var parent = node.parentNode;
  var next = node.nextSibling;
  if (next) {
    parent.insertBefore(elem,next);
  }
  else {
    parent.appendChild(elem);
  }
  return elem;
} // insertAfter

var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
              'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

// convert the time in Epoch Seconds to a string like Aug 18 2007 14:05
function time2DateTime2 (time) {
    var date = new Date();
    date.setTime(time*1000); // JavaScript uses milliseconds while Perl seconds

    var hours = date.getHours();
    var minutes = date.getMinutes();
    if (hours < 10) {
      hours = '0' + hours;
    }
    if (minutes < 10) {
      minutes = '0' + minutes;
    }
    return months[date.getMonth()] + ' ' +
           date.getDate() + ' ' + date.getFullYear() + ' ' +
           hours + ':' + minutes;
} // time2DateTime2


// return the number of lines in string str
function countLines (str)
{
  var lastIndex = -1;
  var lines = 1;
  for (;;) {
    lastIndex = str.indexOf('\n',lastIndex) + 1;
    if (lastIndex == 0) {
      return lines;
    }
    lines++;
  }
} // countLines

// compute the list of keys, similar to the Perl keys function for hashes
function keys(obj)
{
  var result = [];
  for (var key in obj) {
    result.push(key);
  }
  return result;
} // keys

// compute the list of values, similar to the Perl keys function for hashes
function values(obj)
{
  var result = [];
  for (var key in obj) {
    result.push(obj[key]);
  }
  return result;
} // values

// for debugging, shows the state of an object. 
// Depth is the depth to which sub-object states are to be 
// followed.
function showObjectState (obj,depth)
{
  depth = depth || 0;
  var lines = [];
  showObjectState1(obj,depth,lines,'');
  alert(lines.join('\n'));
} // showObjectState

// an auxiliary function for showObjectState
function showObjectState1(obj,depth,lines,prefix)
{
  var ks = keys(obj).sort();
  for (var i = 0;i < ks.length;i++) {
    var key = ks[i];
    var value = obj[key];
    var val = value;
    var tp = typeof(value);
    if (tp == 'function') {
      val = '[function]';
    }
    else if (tp == 'object' && value != null) {
      var arr = [];
      if (arr.constructor == value.constructor) { // array
	val = '[array]';
      }
      else {
	val = '[object]';
      }
    }
    lines.push(prefix + key + '=' + val);
    if (depth > 0) {
      var newPrefix = '  ' + prefix + key + '.';
      if (val == '[array]') { // array
	showObjectState2(value,depth-1,lines,newPrefix);
      }
      else if (val == '[object]') {
	showObjectState1(value,depth-1,lines,newPrefix);
      }
    }
  }
} // showObjectState1

// an auxiliary function for showObjectState
function showObjectState2(arr,depth,lines,prefix)
{
  for (var i = 0;i < arr.length;i++) {
    var newPrefix = prefix + '[' + i + ']';
    var value = arr[i];
    var val = value;
    var tp = typeof(value);
    if (tp == 'function') {
      val = '[function]';
    }
    else if (tp == 'object' && value != null) {
      if (arr.constructor == value.constructor) { // array
	val = '[array]';
      }
      else {
	val = '[object]';
      }
    }
    lines.push(newPrefix + '=' + val);
    if (depth) {
      if (val == '[array]') { // array
	showObjectState2(value,depth-1,lines,'  ' + newPrefix);
      }
      else if (val == '[object]') {
	showObjectState1(value,depth-1,lines,'  ' + newPrefix);
      }
    }
  }
} // showObjectState2

// encode(value)
//   encode the value to a string. Inverse to the Perl function decode
//   defined in the Exchange module
function encode (value)
{
  var result = [];
  encode1(value,result);

  return result.join('');
} // encode

function encode1 (value,result)
{
  // string, object, number, undefined
  if (value == undefined) { // includes null
    result.push('Z1');
    return;
  }
  if (value === true) {
    result.push('1');
    return;
  }
  if (value === false) {
    result.push('0');
    return;
  }
  var tp = typeof(value);
  if (tp == 'string') {
    if (value == '') {
      result.push('Z2');
      return;
    }
    result.push(value.replace(/Z/g,'Z0'));
    return;
  }

  if (tp == 'number') {
    result.push(value);
    return;
  }

  if (tp == 'function') {
    result.push('[function]');
    return;
  }

  if (tp != 'object') {
    throw 'unrecognized type in function encode1';
  }

  var arr = [];
  if (value.constructor == arr.constructor) { // array
    result.push('Z[');
    var length = value.length;
    for (var i = 0;i < length;i++) {
      encode1(value[i],result);
      result.push('Z,');
    }
    result.push('Z]');
    return;
  }

  result.push('Z{');
  for (var key in value) {
    var val = value[key];
    result.push(key.replace(/Z/g,'Z0'), 'Z:');
    encode1(val,result);
    result.push('Z,');
  }
  result.push('Z}');
} // encode

// return the difference between two dates start and end in milliseconds
// can be used for benchmarking
function timeDiff (end,start)
{
  return (1000*end.getUTCSeconds() + end.getUTCMilliseconds()) -
         (1000*start.getUTCSeconds() + start.getUTCMilliseconds());
}

// decode(string)
//   decode the string to a value. Inverse to the Perl function encode
//   defined in the Exchange module.
function decode(strng)
{
  var stack = [];
  var b = strng.match(/^([^Z]+)(Z.*)/);
  if (b) {
    stack.push(b[1]);
    strng = b[2];
  }
  if (strng.match(/^([^Z]*)$/)) {
    return(strng);
  }
  var reg = new RegExp("(Z.)([^Z]*)","g");

  var objects = [];
  var types = [];   // stack of types: 0:array, 1:object
  var keys = [];    // stack of keys
  var str = [];     // parts of the current string
  var obj = null;   // current container
  var tp = 2;       // type of current container 0:array,1:object,2:anything
  var key = null;   // the value of the last key

  var reserve = null;
  var token;
  for (;;) {
    if (reserve != null) {
      token = reserve;
      reserve = null;
    }
    else {
      var m = reg.exec(strng);
      if (! m) {
	if (obj != null) {
	  logError(err,'decode',
		   {string : strng});
	  throw 'non-terminating string';
	}
	return str.join('');
      }
      token = m[1];
      if (m[2] != '') {
	reserve = m[2];
      }
    }
    switch (token) {
    case 'Z{':
      {
	var newObj = {};
	switch (tp) {
	case 2: // nothing
	  tp = 1;
	  obj = newObj;
	  break;
	case 1: // object
	  obj[key] = newObj;
	  key = null;
	  objects.push(obj);
	  types.push(1);
	  keys.push(key);
	  obj = newObj;
	  break;
	case 0: // array
	  obj.push(newObj);
	  objects.push(obj);
	  types.push(0);
	  keys.push(key);
	  tp = 1;
	  obj = newObj;
	  break;
	}
      }
      break;

    case 'Z}':
      if (objects.length == 0) {
	return obj;
      }
      obj = objects.pop();
      tp = types.pop();
      key = keys.pop();
      break;

    case 'Z[':
      {
	var newObj = [];
	switch (tp) {
	case 2: // nothing
	  tp = 0;
	  obj = newObj;
	  break;
	case 1: // object
	  obj[key] = newObj;
	  key = null;
	  objects.push(obj);
	  types.push(1);
	  keys.push(key);
	  obj = newObj;
	  tp = 0;
	  break;
	case 0: // array
	  obj.push(newObj);
	  objects.push(obj);
	  types.push(0);
	  keys.push(key);
	  obj = newObj;
	  break;
	}
      }
      break;

    case 'Z]':
      if (objects.length == 0) {
	return obj;
      }
      obj = objects.pop();
      tp = types.pop();
      key = keys.pop();
      break;

    case 'Z,':
      if (tp) { // object
	if (str.length) {
	  obj[key] = str.join('');
	  key = null;
	  str = [];
	}
	break;
      }
      // array
      if (str.length) {
	obj.push(str.join(''));
	str = [];
      }
      break;

    case 'Z:':
      key = str.join('');
      str = [];
      break;

    case 'Z1': // undefined
      switch (tp) {
      case 2: // nothing
	return undefined;
      case 1: // object
	obj[key] = undefined;
	key = null;
	break;
      case 0: // array
	obj.push(undefined);
	break;
      }
      break;

    case 'Z0':
      str.push('Z');
      break;
    case 'Z2':
      str.push('');
      break;
    case 'Z3':
      str.push('"');
      break;
    case 'Z4':
      str.push('\n');
      break;
    case 'Z5':
      str.push('\\');
      break;
    default:
      str.push(token);
      break;
    }
  }
} // decode

// return a value obtain by truncating the value to a certain depth
function truncate(value,depth)
{
  if (typeof(value) != 'object' || value == null) {
    return value;
  }

  var arr = [];
  var isArray = (arr.constructor == value.constructor);

  if (! depth) {
    return isArray ? '[array]' : '[object]';
  }

  if (isArray) { // array
    var length = value.length;
    var result = new Array(length);
    for (var i = length-1;i >= 0;i--) {
      result[i] = truncate(value[i],depth-1);
    }
    return result;
  }

  var result = {};
  for (var key in value) {
    result[key] = truncate(value[key],depth-1);
  }
  return result;
} // truncate

function skypePlugin()
{
    var pageContent = document.documentElement.innerHTML;
    if (pageContent.indexOf('/document_iterator.js') == -1) {
	return false;
    }
    alert('There was a JavaScript error caused by a Skype add-on '+
	  'for your browser. Unfortunately, this add-on interferes '+
	  'with other scripts and sometimes causes them to break. '+
	  'If using this page is essential for you and it does '+
	  'work you should either change to another browser or uninstall '+
	  'the Skype add-on.');
    return true;
} // skypePlugin

function logError (err,func,extra)
{
  extra = extra || {};
  extra.func = func;
  try {
    for (var key in extra) {
      extra[key] = encode(extra[key]);
    }

    extra.err = encode(err);
    extra.cool = encode(cool);
    if (window.debug) {
      extra.debug = encode(window.debug);
    }
    extra.page = encode(document.documentElement.innerHTML);
    extra.response = lastLoadObjectResponse;
    extra.responseString = encode(lastLoadObjectResponse);
    extra.menu = encode(window.Menu);
  }
  catch (err) {
    if (logError.tried) {
      return;
    }
    logError.tried = true;
    extra["ERROR"] = err;
  }

  loadObject('/utils/javascript_error_x.cgi',
 	     doNothing,
 	     extra);
} // logError

// true if the value is an integer
function isInteger (value)
{
  return ! isNaN(Number(value)) &&
         Number(value) == parseInt(value);
} // isInteger

// function to find the absolute position of an HTML element in the 
// document
function absPosition (elem)
{
  var left = 0;
  var top = 0;
  for (var out = elem; out; out=out.offsetParent) {
    left += out.offsetLeft; 
    top += out.offsetTop; 
  }
  return {left : left,
         right : left + elem.offsetWidth,
           top : top,
        bottom : top + elem.offsetHeight}
} // absPosition

// return the size of the browser window
function windowGeometry()
{
    var geo = {};
    // position of the browser on the desktop
    if (window.screenX !== undefined) {
	geo.screenX = window.screenX;
	geo.screenY = window.screenY;
    }
    else if (window.screenLeft !== undefined) {
	geo.screenX = window.screenLeft;
	geo.screenY = window.screenTop;
    }
    // dimensions of the HTML (may be smaller than the visible
    // part of the window)
    if (window.innerWidth !== undefined) {
	geo.innerWidth = window.innerWidth;
	geo.innerHeight = window.innerHeight;
	geo.pageXOffset = window.pageXOffset;
	geo.pageYOffset = window.pageYOffset;
    }
    else if (document.documentElement.clientWidth !== undefined) {
	geo.innerWidth = document.documentElement.clientWidth;
	geo.innerHeight = document.documentElement.clientHeight;
	geo.pageXOffset = document.documentElement.scrollLeft;
	geo.pageYOffset = document.documentElement.scrollTop;
    }
    else if (document.body.clientWidth !== undefined) {
	geo.innerWidth = document.body.clientWidth;
	geo.innerHeight = document.body.clientHeight;
	geo.pageXOffset = document.body.scrollLeft;
	geo.pageYOffset = document.body.scrollTop;
    }
    return geo;
} // windowGeometry

// true if elem fits in the current window
function fitsInWindow (elem)
{
  var pos = absPosition(elem);
  var win = windowGeometry();
  return pos.left >= win.pageXOffset &&
         pos.right <= win.innerWidth &&
         pos.top >= win.pageYOffset &&
         pos.bottom <= win.innerHeight;
} // fitsInWindow

// true if elem fits in the current window vertically
function fitsVertically (elem)
{
  var pos = absPosition(elem);
  var win = windowGeometry();
  return pos.top >= win.pageYOffset &&
         pos.bottom <= win.innerHeight;
} // fitsVertically

// add CSS rule of the form selector {styles}
function addCSSRule (selector,styles)
{
  if (styles == '' && (getBrowser() == 'Konqueror' || 
		       getBrowser() == 'IE')) {
    // Konqueror and (of course) IE do not understand empty declarations
    return;
  }
  var ss = document.styleSheets[0];
  if (ss.insertRule) { // W3C API
    ss.insertRule(selector + '{' + styles + '}',0);
    return;
  }
  // the much hated IE, as usual
  ss.addRule(selector,styles,0);
} // addCSSRule


// given lines, split them into a list of lines of length of length of
// at most 60 characters, same as Common.splitLongLines in Perl
function splitLongLines (lines)
{
  var result = [];
  for (var i = 0;i < lines.length;i++) {
    var line = lines[i];
    while (line.length > 60) {
      var first = line.substring(0,60);
      var m = first.match(/^(.*)\s(\S*)$/);
      if (m) {
	result.push(m[1]);
	line = m[2] + line.substring(60);
      }
      else {
	result.push(first);
	line = line.substring(60);
      }
    }
    result.push(line);
  }
  return result;
} // splitLongLines

// return the source (HTML element) of the event
// If attrib is defined and the found element does not have this attribute
// then search among predecessors of this event
function eventSource(event,attrib)
{
  event = event || window.event;
  if (! event) {
    return false;
  }
  var source = event.srcElement || event.target;
  if (! attrib) {
    return source;
  }
  while (source && !source[attrib] &&
	 (!source.getAttribute || !source.getAttribute(attrib))) {
    source = source.parentNode;
  }
  return source;
} // eventSource

// IE does not define the standard window.getComputedStyle
if (! window.getComputedStyle) {
  window.getComputedStyle = function(elem)
    {
      return elem.currentStyle;
    };
}

// remove element from the document
function removeElement(element)
{
  element.parentNode.removeChild(element);
} // removeElement

// remove all children of element
function removeChildren(element)
{
  var children = element.childNodes;
  for (var i = children.length-1;i >= 0;i--) {
    element.removeChild(children[i]);
  }
} // removeChildren

// display the text in a popup window. After the timeout time (default=2500)
// in milliseconds the window will disappear. The popup window will
// be centered horizontally and vertically be on the top of the visible
// part of the window but below the menu if any part of the menu
// is visible
var lastReport = 0;
function report(text,timeout)
{
  var elem = $('reportSink');
  if (!elem) {
    elem = $_('div',{id:'reportSink',className:'textPopup'},
	      false,document.body,{position:'absolute'});
  }
  else {
    removeChildren(elem);
  }
  $T(text,elem);
  // positioning the element in the window

  var size = getWindowSize();
  var windowPos = getWindowPos();
  var x = Math.round(size.x/2 - elem.offsetWidth/2) + windowPos.x;
  elem.style.left = x + 'px';
  var menuElem = $('menu0');
  if (menuElem) {
    var bot = absPosition(menuElem).bottom+3;
    var offset = windowGeometry().pageYOffset;
    elem.style.top = (bot > offset ? bot : offset) + 'px';
  }
  else {
    elem.style.top = '3px';
  }
  elem.style.visibility = 'visible';
  timeout = timeout || 2500;
  setTimeout('hideReport(' + (++lastReport) + ')',timeout);
}

// hide the report window
function hideReport(n)
{
  if (n != lastReport) {
    return;
  }
  clearReport();
} // hideReport

// hide the report window
function clearReport()
{
  var reportElem = $('reportSink');
  if (reportElem) {
    reportElem.style.visibility = 'hidden';
  }
} // clearReport

// changing the style of an HTML Element
function addStyle(element,obj)
{
  var style = element.style;
  for (var key in obj) {
    style[key] = obj[key];
  }
} // addStyle()

// add attributes of an element
function addAttributes(element,obj)
{
  for (var key in obj) {
    element.setAttribute(key,obj[key]);
  }
} // addAttributes

// return a random string of the given length
function randomString(length)
{
  var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
  var result = '';
  var n = chars.length;
  for (var i=length; i > 0; i--) {
    var rnum = Math.floor(Math.random() * n);
    result += chars.substring(rnum,rnum+1);
  }
  return result;
} // randomString

// add a row with given attributes and style (both optional)
// as the last row in the table
function appendRow(table,attributes,style)
{
  var row = table.insertRow(table.rows.length);
  if (attributes) {
    for (var att in attributes) {
      row[att] = attributes[att];
    }
  }
  if (style) {
    var stl = row.style;
    for (var par in style) {
      stl[par] = style[par];
    }
  }
  return row;
} // appendRow

// add a cell with given attributes (optional) and text (optional)
// as the last cell in the row
function appendCell(row,attributes,text,style)
{
  var cell = row.insertCell(row.cells.length);
  if (attributes) {
    for (var att in attributes) {
      cell[att] = attributes[att];
    }
  }
  if (text) {
    $T(text,cell);
  }
  if (style) {
    var stl = cell.style;
    for (var par in style) {
      stl[par] = style[par];
    }
  }
  return cell;
} // appendCell

// fade the whole page
function fadePage()
{
  $('content').style.color = 'rgb(80%,80%,80%)';
  if ($('title')) {
    $('title').style.color = 'rgb(80%,80%,80%)';
  }
} // fadePage

// unfade the page
function unfadePage()
{
  $('content').style.color = '';
  if ($('title')) {
    $('title').style.color = '';
  }
} // unfadePage

// collects all text inside an HTML element. If the element contains <br> tags, they are replaced
// by new the line symbols
function elementText(element)
{
  var text = [];
  var nodes = [element];
  while (nodes.length > 0) {
    var node = nodes.shift();
    if (node.nodeType == 3) { // text node
      text.push(node.data);
    }
    else if (node.tagName == 'BR') {
      text.push('\n');
    }
    else {
      for (var i = node.childNodes.length-1; i>=0; i--) {
	nodes.unshift(node.childNodes[i]);
      }
    }
  }
  return text.join('');
} // elementText

function isEmpty(obj)
{
  var empty = true;
  for (var v in obj) {
    empty = false;
    break;
  }
  return empty;
}

// base name of a file
function basename(file)
{
  var pos = file.lastIndexOf('/');
  if (pos == -1) {
    pos = file.lastIndexOf('\\');
  }
  if (pos == -1) {
    return file;
  }
  return file.substr(pos+1);
}

// file extension
function extension(file)
{
  var pos = file.lastIndexOf('.');
  if (pos == -1) {
    return '';
  }
  return file.substr(pos+1);
}

// save and erase the content (everything inside the content div) in an element and
// return this element. If newContent is true, then replace it by the new content
function saveContent(newContent)
{
  var oldContent= document.createDocumentFragment();
  var contentDiv = $('content');
  while (contentDiv.hasChildNodes()) {
    oldContent.appendChild(contentDiv.firstChild);
  }
  if (newContent) {
    contentDiv.appendChild(newContent);
  }
  return oldContent;
}

// sel must be a selection element
// return the current selection and null if no selection
function getSelection(sel)
{
    var selectedIndex = sel.selectedIndex;
    if (!isInteger(selectedIndex) || selectedIndex < 0) {
	return null;
    }
    var selectedOption = sel.options[selectedIndex];
    return selectedOption.value;
} // getSelection

// sel must be a selection element
// selects the option having the value val
function setSelection(sel,val)
{
  var opts = sel.options;
  for (var oindex = opts.length-1;oindex >= 0;oindex--) {
    if (opts[oindex].value == val) {
      sel.selectedIndex = oindex;
      return;
    }
  }
  sel.selectedIndex = -1;
}

Array.Iterator = function(array,reverse)
{
    this.array = array;
    this.reverse = reverse;
    this.nextIndex = reverse ? array.length-1 : 0;
    this.more = array.length;
}

Array.Iterator.prototype.hasNext = function()
{
    return this.more;
}

Array.Iterator.prototype.next = function()
{
    if (this.more <= 0) {
	throw "Iterator";
    }
    this.more--;
    var nextElem = this.array[this.nextIndex];
    this.nextIndex += this.reverse ? -1 : 1;
    return nextElem;
}

var tick = '\u2714';
var nbsp = '\u00A0';

function addDebug(key,val)
{
    if (!window.debug) {
	window.debug = {};
    }
    window.debug[key] = val;
}

function deleteDebug(key)
{
    if (window.debug) {
	delete window.debug[key];
    }
}

// erase all debugging information
function eraseDebug()
{
    window.debug = 0;
}

// make a summary of the value val
// if val is an object, then its attribute-value pairs will be
// enumerated and returned as an object
function valueSummary(val)
{
    if (typeof val != 'object') {
	return val;
    }
    var summary = {};
    // val is an object
    try {
	for (var key in val) {
	    summary[key] = '<access denied>';
	    try {
		var v = val[key];
		if (typeof v == 'object') {
		    summary[key] = v.toString();
		}
		else {
		    summary[key] = v;
		}
	    }
	    catch (err) {
	    }
	}
	return summary;
    }
    catch (err) {
	return "<access to the object properties denied>";
    }
} // valueSummary

// this part corresponds to the Jargon module
var $PC_ = 'PC';
var $Program_Committee_ = 'Program Committee';
var $Program_committee_ = 'Program committee';
var $program_committee_ = 'program committee';
var $PC_Member_ = 'PC Member';
var $PC_member_ = 'PC member';
var $pc_member_ = 'PC member';
var $PC_Members_ = 'PC Members';
var $PC_members_ = 'PC members';
var $pc_members_ = 'PC members';
var $Topic_ = 'Topic';
var $Topics_ = 'Topics';
var $topic_ = 'topic';
var $topics_ = 'topics';
