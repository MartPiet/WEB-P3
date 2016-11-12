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
                <tr><th>Titel</th><th>Name</th><th>Vorname</th><th>Lehrgebiet</th><th>Aktion</th></tr>

                ## man verwendet hier Zugriff auf das Dictionary "data_o"

                %for element in data_o:
                    <tr id="r${data_o.index(element)}"><td>${element['titel_s']}</td><td>${element['name_s']}</td><td>${element['vorname_s']}</td><td>${element['lehrgebiet_s']}</td><td><a href="/edit/tutor/${data_o.index(element)}">bearbeiten</a>&nbsp;<a class="clDelete" href="/delete/tutor/${data_o.index(element)}">löschen</a></td></tr>
                % endfor
			</table>
		<div>
			<a href="/add/tutor">erfassen</a> <a href="../">Startseite</a>
		</div>
	</body>
</html>



