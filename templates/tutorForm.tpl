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
		<form id="idWTForm" action="/save/tutor/${id_s}" method="POST">
           	<input type="hidden" value="${id_s}" id="id_s" name="id_s" /> 
			<div>
				<label for="titel_s">Titel</label>
				<input type="text" value="${data_o['titel_s']}" id="titel_s" name="titel_s" required/>
				<label for="name_s">Name</label>
				<input type="text" value="${data_o['name_s']}" id="name_s" name="name_s" required/>
				<label for="vorname_s">Vorname</label>
				<input type="text" value="${data_o['vorname_s']}" id="vorname_s" name="vorname_s" required/>
				<label for="lehrgebiet_s">Lehrgebiet</label>
				<input type="text" value="${data_o['lehrgebiet_s']}" id="lehrgebiet_s" name="lehrgebiet_s" required/>
			</div>
			<div>
				<input type="submit" value="Speichern"/>
				<a class="clCancel" href="/list/${listform_s}">Zurück</a>
			</div>
		</form>
	</body>
</html>