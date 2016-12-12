## coding: utf-8
<html>
	<head> 
		<title>Web-Teams</title> 
		<meta charset="UTF-8" /> 
		<style>
			@import "/webteams.css"; 
		</style>
	</head>
		<body link="#800080" bgcolor="#ffffff" text="#000080" vlink="#ff0000"><b><font size="6">
			<p align="center">P</font><font size="4">raxis</font><font size="6">P</font><font size=4>hasen</font><font size="6">M</font><font size="4">anager
			<hr>
         		<a href="/list/student">Studenten</a> - <a href="/list/tutor">Lehrende</a> - <a href="/list/company">Firmenverzeichnis</a> - <a href="/list/offer">Angebote</a> - <a href="/evaluation">Auswertung</a>
        	<hr> 
            <table id="idList">
                <tr><th>Firma</th><th>Branche</th><th>Tätigkeitsschwerpunkt</th><th>Sitz</th><th>Anzahl Mitarbeiter</th><th>Aktion</th></tr>

                ## man verwendet hier Zugriff auf das Dictionary "data_o"

                %for element in data_o:
                    <tr id="r${data_o.index(element)}"><td>${element['firmenname_s']}</td><td>${element['branche_s']}</td><td>${element['taetigschw_s']}</td><td>${element['sitz_s']}</td><td>${element['anzMitarbeiter_s']}</td><td><a href="/edit/company/${data_o.index(element)}">bearbeiten</a>&nbsp;<a class="clDelete" href="/delete/company/${data_o.index(element)}">löschen</a></td></tr>
                % endfor
			</table>
		<div>
			<a href="/add/company">erfassen</a> <a href="/index.html">Startseite</a>
		</div>
	</body>
</html>



