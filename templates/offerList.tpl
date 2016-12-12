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
                <tr><th>Firma</th><th>Beschreibung</th><th>Voraussetzungen</th><th>Betreuer</th><th>Firmenbetreuer<th>Aktion</th></tr>
                %for element in data_o:
                    %if element['status_s'] == 'angebot':

                    <tr id="r${data_o.index(element)}"><td>${offer['company'][int(element['firmaID_s'])]['firmenname_s']}</td><td>${element['beschreibung_s']}</td><td>${element['voraussetzungen_s']}</td><td>${offer['tutor'][int(element['betreuerID_s'])]['name_s']}</td><td>${element['firmenbetreuer_s']}</td>
                    % if element['status_s'] == 'angebot':
                    	<td><a href="/edit/offer/${data_o.index(element)}">bearbeiten</a>&nbsp;<a class="clDelete" href="/delete/offer/${data_o.index(element)}">löschen</a></td></tr>
                    % else:
                    	<td>Nicht möglich</td>
                    % endif
                % endfor
			</table>
		<div>
			<a href="/add/offer">erfassen</a> <a href="/index.html">Startseite</a>
		</div>
	</body>
</html>



