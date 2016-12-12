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
				Firma: ${offer['company'][int(data_o['firmaID_s'])]['firmenname_s']} <br>
				Beschreibung: ${data_o['beschreibung_s']} <br>
				Voraussetzungen: ${data_o['voraussetzungen_s']} <br>
				Betreuer: ${offer['tutor'][int(data_o['betreuerID_s'])]['titel_s']} ${offer['tutor'][int(data_o['betreuerID_s'])]['name_s']} <br>
				Firmenbetreuer: ${data_o['firmenbetreuer_s']} <br>
				<label for="von_s">Von</label>
				<input type="text" value="${data_o['von_s']}" id="von_s" name="von_s" required/>
				<label for="bis_s">Bis</label>
				<input type="text" value="${data_o['bis_s']}" id="bis_s" name="bis_s" required/>
				<label for="studentID_s">Student</label>
				<select id="studentID_s" name="studentID_s">
					%for element in offer['student']:
	 					<option value="${offer['student'].index(element)}">${element['name_s']}</option>
	 				%endfor
			 	</select>
			</div>
			<div>
				<input type="submit" value="Speichern"/>
				<a class="clCancel" href="/studentofferslist/${listform_s}">Zurück</a>
			</div>
		</form>
	</body>
</html>