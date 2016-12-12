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
	<body link="#800080" bgcolor="#ffffff" text="#000080" vlink="#ff0000"><b><font size="6">
			<p align="center">P</font><font size="4">raxis</font><font size="6">P</font><font size=4>hasen</font><font size="6">M</font><font size="4">anager
			<hr>
         		<a href="/list/student">Studenten</a> - <a href="/list/tutor">Lehrende</a> - <a href="/list/company">Firmenverzeichnis</a> - <a href="/list/offer">Angebote</a> - <a href="/evaluation">Auswertung</a>
        	<hr>
		<form id="idWTForm" action="/save/offer/${id_s}" method="POST">
           	<input type="hidden" value="${id_s}" id="id_s" name="id_s" /> 
			<div>
				<label for="firmaID_s">Firma</label>
				<select id="firmaID_s" name="firmaID_s">
					%for element in offer['company']:
	 					<option value="${offer['company'].index(element)}">${element['firmenname_s']}</option>
	 				%endfor
				</select>

				<label for="beschreibung_s">Beschreibung</label>
				<input type="text" value="${data_o['beschreibung_s']}" id="beschreibung_s" name="beschreibung_s" required/>

				<label for="voraussetzungen_s">Voraussetzungen</label>
				<input type="text" value="${data_o['voraussetzungen_s']}" id="voraussetzungen_s" name="voraussetzungen_s" required/>
				
				<label for="betreuerID_s">Betreuer</label>
				<select id="betreuerID_s" name="betreuerID_s">
					%for element in offer['tutor']:
	 					<option value="${offer['tutor'].index(element)}">${element['name_s']}</option>
	 				%endfor
			 	</select>

			 	<label for="firmenbetreuer_s">Firmenbetreuer</label>
				<input type="text" value="${data_o['firmenbetreuer_s']}" id="firmenbetreuer_s" name="firmenbetreuer_s" required/>
			</div>
			<div>
				<input type="submit" value="Speichern"/>
				<a class="clCancel" href="/list/${listform_s}">Zurück</a>
			</div>
		</form>
	</body>
</html>