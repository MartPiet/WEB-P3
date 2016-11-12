## coding: utf-8
<html>
	<head> 
		<title>Web-Teams</title> 
		<meta charset="UTF-8" /> 
		<style>
			@import "/webteams.css"; 
		</style>
	</head>
		<body> 
            <table id="idList">
                <tr><th>Firma</th><th>Beschreibung</th><th>Voraussetzungen</th><th>Aktion</th></tr>
                %for element in data_o:
                    <tr id="r${data_o.index(element)}"><td>${offer[int(element['firmaID_s'])]["firmenname_s"]}</td><td>${element['beschreibung_s']}</td><td>${element['voraussetzungen_s']}</td><td><a href="/edit/offer/${data_o.index(element)}">bearbeiten</a>&nbsp;<a class="clDelete" href="/delete/offer/${data_o.index(element)}">löschen</a></td></tr>
                % endfor
			</table>
		<div>
			<a href="/add/offer">erfassen</a> <a href="../">Startseite</a>
		</div>
	</body>
</html>



