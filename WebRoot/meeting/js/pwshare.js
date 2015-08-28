
function removeOption(formSelection, row) {	
	var len = formSelection.length;
	if (len > 0)
	{
		formSelection.options[row] = null;
	}
}

function addOption(formSelection, optionText, optionValue) {
	var newOption = new Option(optionText, optionValue);
	var selectionLen = formSelection.length;
	formSelection.options[selectionLen] = newOption;
}

function selectList2() {
	for (i=0; i<document.urlForm.elements['apisSelected[]'].length; i++) {
		document.urlForm.elements['apisSelected[]'][i].selected = true;
	}
	return true;
}

function selectall(obj) {
	obj = (typeof obj == "string") ? document.getElementById(obj) : obj;
	if (obj.tagName.toLowerCase() != "select")
		return;
	for (i=0; i<obj.length; i++) {
		obj[i].selected = true;
	}
	return true;
}

function moveOptions(selectionA, selectionB) {
	var selectionLen = selectionA.length;
	var selectedText = new Array();
	var selectedValues = new Array();
	var selectedCount = 0;
	
	for( var i = selectionLen-1; i >= 0; i--)
	{
		if(selectionA.options[i].selected)
		{
			selectedText[selectedCount] = selectionA.options[i].text;
			selectedValues[selectedCount] = selectionA.options[i].value;
			removeOption(selectionA, i);
			selectedCount++;
		}
	}
	
	for( i = selectedCount-1; i >= 0; i--)
	{
		addOption(selectionB, selectedText[i], selectedValues[i]);
	}
}

sortitems = 1;  // Automatically sort items within lists? (1 or 0)

function move(fbox,tbox) {
	for(var i=0; i<fbox.options.length; i++) {
		if(fbox.options[i].selected && fbox.options[i].value != "") {
			var no = new Option();
			no.value = fbox.options[i].value;
			no.text = fbox.options[i].text;
			//alert(no.value + ' ' + no.text);
			tbox.options[tbox.options.length] = no;
			fbox.options[i].value = "";
			fbox.options[i].text = "";
		}
	}
	BumpUp(fbox);
	if (sortitems)
		SortS(tbox);
}

function BumpUp(box)  {
	for(var i=0; i<box.options.length; i++) {
		if(box.options[i].value == "")  {
			for(var j=i; j<box.options.length-1; j++)  {
				box.options[j].value = box.options[j+1].value;
				box.options[j].text = box.options[j+1].text;
			}
			var ln = i;
			break;
		}
	}
	if(ln < box.options.length)  {
		box.options.length -= 1;
		BumpUp(box);
	}
}

/*
Assuming that we only want to sort the last item into a list of sorted items, 
we can sort 600x faster.
*/
function SortS(box)  {
	var temp_opts = new Array();
	var temp = new Object();
	// If you say temp_opts[i] = box.options[k]; it doesn't work due to javascript bugginess.
	var oNew = new Object();
	oNew.t = box.options[box.options.length - 1].text;
	oNew.v = box.options[box.options.length - 1].value;
	var olc = oNew.t.toLowerCase();
	var k = 0;
	for(var i=0; i<box.options.length; i++)  {
		ilc = box.options[k].text.toLowerCase();
		if ((olc != '') && (olc < ilc)) {
			// Put the new one in its place.
			olc = '';
			temp_opts[i] = oNew;
			continue;
		}
		temp_opts[i] = new Object();
		temp_opts[i].t = box.options[k].text;
		temp_opts[i].v = box.options[k].value;
		k++;
	}
	for(var i=0; i<box.options.length; i++)  {
		box.options[i].value = temp_opts[i].v;
		box.options[i].text = temp_opts[i].t;
	}
}

function SortD(box)  {
	var temp_opts = new Array();
	var temp = new Object();
	for(var i=0; i<box.options.length; i++)  {
		temp_opts[i] = box.options[i];
	}
	for(var x=0; x<temp_opts.length-1; x++)  {
		for(var y=(x+1); y<temp_opts.length; y++)  {
			xlc = temp_opts[x].text.toLowerCase();
			ylc = temp_opts[y].text.toLowerCase();
			if(xlc > ylc)  {
				temp = temp_opts[x].text;
				temp_opts[x].text = temp_opts[y].text;
				temp_opts[y].text = temp;
			}
		}
	}
	for(var i=0; i<box.options.length; i++)  {
		box.options[i].value = temp_opts[i].value;
		box.options[i].text = temp_opts[i].text;
	}
}
