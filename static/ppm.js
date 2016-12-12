//var listform = "table";
var selectedCellIndex = 0;
var selectedID = "";
var entity = "";

function action_p (event_opl) {
		console.log('######################CLICK######################')

	if (event_opl.target.tagName.toLowerCase() == "td") {
		console.log("1")

		select(event_opl.target.parentElement.rowIndex);
	
	} else if ((event_opl.target.tagName.toLowerCase() == "a") && (event_opl.target.parentElement.localName == "header")) {
		console.log("2")

		entity = event_opl.target.id
		getData(entity)

	} else if (event_opl.target.className == "clCancel") {
		console.log("3")
		closeForm(entity)

	} else if (event_opl.target.className == "clDelete") {
		console.log("4")
		console.warn(window.location);
	  	if (confirm("Wirklich löschen?")) {
	  		deleteEntry(event_opl.target.id);
			alert("Eintrag gelöscht.");
		} else {
			event_opl.preventDefault();
		}
	
	} else if (event_opl.target.className == "clEdit") {
		console.log("5")

		getData(entity, selectedCellIndex)
	}
}

window.onload = function () {
	var body_o = document.getElementsByTagName('body')[0]; 
	body_o.addEventListener('click', action_p, false);
}

function select(x) {
	selectedCellIndex = x - 1;
    console.log("Cell index is: " + selectedCellIndex);
}

function getForm(entity) {
	window.location = "/edit/" + entity + "/" + selectedCellIndex;
}

function selectID(id) {
	selectedID = id;
}

function getEnrollmentForm() {
	window.location = "/enroll/" + selectedID;
}

function setEntity(entity) {
	entity = newEntity
}

function getEntity() {
	return entity
}

function deleteEntry(entity) {
	window.location = "/delete/" + entity + "/" + selectedCellIndex;
}