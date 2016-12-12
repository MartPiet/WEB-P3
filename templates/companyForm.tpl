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
		<form id="idWTForm" action="/save/company/${id_s}" method="POST">
           	<input type="hidden" value="${id_s}" id="id_s" name="id_s" /> 
			<div>
				<label for="firmenname_s">Firmenname</label>
				<input type="text" value="${data_o['firmenname_s']}" id="firmenname_s" name="firmenname_s" required/>
				<label for="branche_s">Branche</label>
				<input type="text" value="${data_o['branche_s']}" id="branche_s" name="branche_s" required/>
				<label for="taetigschw_s">Tätigkeitsschwerpunkt</label>
				<input type="text" value="${data_o['taetigschw_s']}" id="taetigschw_s" name="taetigschw_s" required/>
				<label for="sitz_s">Sitz</label>
				<input type="text" value="${data_o['sitz_s']}" id="sitz_s" name="sitz_s" required/>
				<label for="anzMitarbeiter_s">Anzahl Mitarbeiter</label>
				<input type="text" value="${data_o['anzMitarbeiter_s']}" id="anzMitarbeiter_s" name="anzMitarbeiter_s" required/>
			</div>
			<div>
				<input type="submit" value="Speichern"/>
				<a class="clCancel" href="/list/${listform_s}">Zurück</a>
			</div>
		</form>
	</body>
</html>