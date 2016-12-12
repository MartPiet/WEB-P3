## coding: utf-8
<html>
	<head> 
		<title>PPM</title> 
		<meta charset="UTF-8" /> 
		<style>
			@import "/webteams.css"; 
		</style>
	</head>
		<body> 
            <table id="idList">
                <tr><th>Firma</th><th>Beschreibung</th><th>Voraussetzungen</th><th>Betreuer</th><th>Firmenbetreuer<th>Aktion</th></tr>
                %for element in data_o:
                	%if element['status_s'] == 'angebot':
	                    <tr id="r${data_o.index(element)}"><td>${offer['company'][int(element['firmaID_s'])]['firmenname_s']}</td><td>${element['beschreibung_s']}</td><td>${element['voraussetzungen_s']}</td><td>${offer['tutor'][int(element['betreuerID_s'])]['name_s']}</td><td>${element['firmenbetreuer_s']}</td><td><a href="/enroll/${data_o.index(element)}">Einschreiben</a></tr>
	                    %endif
                % endfor
			</table>
		<div>
			<a href="/index2.html">Startseite</a>
		</div>
	</body>
</html>



