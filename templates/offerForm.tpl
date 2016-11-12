## coding: utf-8
<!DOCTYPE html> 
<html>
	<head> 
		<title>Web-Teams</title> 
		<meta charset="UTF-8" /> 
		<style>
			@import "/webteams.css"; 
		</style>
		<script type="text/javascript" src="/webteams.js"></script> 
	</head>
	<body>
		<form id="idWTForm" action="/save/offer/${id_s}" method="POST">
           	<input type="hidden" value="${id_s}" id="id_s" name="id_s" /> 
			<div>
				<label for="firmaID_s">Firma</label>
				<select id="firmaID_s" name="firmaID_s">
					%for element in offer['company']:
 						<option value="%{index(element)}" id="firmaID_s" name="firmaID_s" >${element['firmenname_s']}</option>
 					%endfor
				</select>
				<label for="beschreibung_s">Beschreibung</label>
				<input type="text" value="${data_o['beschreibung_s']}" id="beschreibung_s" name="beschreibung_s" required/>
				<label for="voraussetzungen_s">Voraussetzungen</label>
				<input type="text" value="${data_o['voraussetzungen_s']}" id="voraussetzungen_s" name="voraussetzungen_s" required/>
				<label for="betreuer_s">Betreuer</label>
				<select id="betreuer_s" name="betreuer_s">
					%for element in offer['tutor']:
 						<option value="${data_o['betreuer_s']}" id="betreuer_s" name="betreuer_s" >${element['betreuer_s']}</option>
 					%endfor
				</select>
				<!--<input type="text" value="${data_o['betreuer_s']}" id="betreuer_s" name="betreuer_s" required/>-->
			</div>
			<div>
				<input type="submit" value="Speichern"/>
				<a class="clCancel" href="/list/${listform_s}">Zurück</a>
			</div>
		</form>
	</body>
</html>