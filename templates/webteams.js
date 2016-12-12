//var listform = "table";

function confirmDelete_p (event_opl) {
	if ((event_opl.target.tagName.toLowerCase() == 'a') && (event_opl.target.className == "clDelete")) {

		console.warn(window.location);
	  	if (confirm("Wirklich löschen?")) {
			alert("Eintrag gelöscht.");
		} else {
			event_opl.preventDefault();
		}
	}/* else if ((event_opl.target.tagName.toLowerCase() == 'button') && (event_opl.target.className == "clCancel")) {
			alert("goBack()");

		goBack();
	}*/
}

window.onload = function () {
var body_o = document.getElementsByTagName('body')[0]; body_o.addEventListener('click', confirmDelete_p, false);
}

/*function goBack() {
    window.location = '/?listform='+listform;

}

function setListForm(newListForm) {
	listform = newListForm;
}
*/