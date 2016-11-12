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
		<form id="idWTForm" action="/save/student/?id=id_s" method="POST">
           	<input type="hidden" value="${id_s}" id="id_s" name="id_s" /> 
			<div>
				<label for="name_s">Name</label>
				<input type="text" value="${data_o['name_s']}" id="name_s" name="name_s" required/>
				<label for="vorname_s">Vorname</label>
				<input type="text" value="${data_o['vorname_s']}" id="vorname_s" name="vorname_s" required/>
				<label for="matrnr_s">Matrikelnummer</label>
				<input type="text" value="${data_o['matrnr_s']}" id="matrnr_s" name="matrnr_s" required/>
			</div>
			<div>
				<input type="submit" value="Speichern"/>
				<a class="clCancel" href="/list/${listform_s}">Zurück</a>
			</div>
		</form>
	</body>
</html>