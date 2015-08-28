var Menu = {
   selected : null, // id of the tab under cursor
   parent : {}, // the parent relation
   hideTime : 25, // time after which menu is hidden onmouseout
   timeout : -1,
   bgColor : "#D0D0F0",
   color : "#003366",
   alertColor : "#800000", //this color has to be set also in cool.css for menualert id
   focusColor : "white",
   focusBgColor : "#003399",
   high : {}, // all highlighted tabs

   followLink : function(id,url)
   {
     try {
       Menu.selected = null,
       Menu.hideAll();
       location.href=url;
     }
     catch (err) {
       logError(err,'Menu.followLink');
     }
   },

   // hide menu after time interval md
   hide : function(id)
   {
     try {
	 if (Menu.selected == id) {
	     Menu.selected = null;
	 }
	 Menu.timeout = setTimeout('Menu.hideAll()',Menu.hideTime);
     }
     catch (err) {
       logError(err,'Menu.hide');
     }
   },

  // for a menu tab with a given id, return the set of all its
  // ancestor tabs
  ancestors : function(id) {
    var result = {};
    result[id] = true;
    var el = $(id).parentNode;
    while (el) {
      if (! el.id || el.id.substring(0,5) != 'tmenu') {
	el=el.parentNode;
	continue;
      }
      var parentId = el.id.substring(1);
      result[parentId] = true;
      el = $(parentId).parentNode;
    }
    return result;
  },

  // unhighlight all highlighted tabs not inherited from
  // the selected element and hide their menus
  hideAll : function()
  {
    try {
      var shown = Menu.selected ? Menu.ancestors(Menu.selected) : {};
      for (var id in Menu.high) {
	if (shown[id]) {
	  continue;
	}
	delete Menu.high[id];
	var menuTab = $(id);
	if (!menuTab) { // this happens with incomplete pages (browser bugs?)
	  return;
	}
	var st = menuTab.style;
	if (!st) { // also happens with incomplete pages
	  return;
	}
	if(id=='menualert') { //to this id we refer also in Menu.pm and cool.css
          st.color = Menu.alertColor;
	}
	else {
	  st.color = Menu.color;
	}
	st.backgroundColor = Menu.bgColor;
	var menu = $('t'+id);
	if (menu) {
	  menu.style.visibility='hidden';
	}
      }
    }
    catch (err) {
      logError(err,'Menu.hideAll');
    }
  },

  // show menu with a given index
  show : function(id)
  {
    try {
      if (id == Menu.selected) {
	return;
      }
      Menu.selected = id;
      Menu.high[id] = true;
      var tab = $(id);
      if (!tab || !tab.style) { // happens due to browser errors
	return;
      }
      tab.style.backgroundColor = Menu.focusBgColor;
      tab.style.color = Menu.focusColor;
      var submenu = $('t'+id);
      if (submenu) {
        var pos = absPosition(tab);
	if (tab.className == 'top') {
	  submenu.style.top = (pos.bottom - 2) + 'px';
	  submenu.style.left = (pos.left + 2) + 'px';
	}
	else {
	  var menu = $('t');
	  submenu.style.top = (pos.top + 1) + 'px';
	  submenu.style.left = (pos.right - 9) + 'px';
	}
	// added at runtime to fix IE 7 bug (shows borders of cells in
	// an invisible table otherwise)
	submenu.style.borderCollapse = 'collapse';
 	submenu.style.visibility = 'visible';
      }
      Menu.hideAll();
    }
    catch (err) {
      logError(err,'Menu.show');
    }
  }
};


