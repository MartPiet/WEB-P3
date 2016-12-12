## coding: utf-8
<html>
<head> 
	<title>PPM</title> 
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
			Firmen
		<hr>
		<table id="idList">
			<tr><th>Firma</th><th>Branche</th><th>Tätigkeitsschwerpunkt</th><th>Sitz</th><th>Mitarbeiter</th></tr>
			%for element in data_o['company']:
				<%
					dataIndex = data_o['company'].index(element)
				%>
				<tr id="r${data_o['company'].index(element)}">
					<td>${data_o['company'][dataIndex]['firmenname_s']}</td>
					<td>${data_o['company'][dataIndex]['branche_s']}</td>
					<td>${data_o['company'][dataIndex]['taetigschw_s']}</td>
					<td>${data_o['company'][dataIndex]['sitz_s']}</td>
					<td>${data_o['company'][dataIndex]['anzMitarbeiter_s']}</td>
				</tr>
			% endfor
		</table>
		<hr>
			Praxisphasen (abgeschlossen)
			<a href="/evaluation/student">Auswertung nach Studenten</a> - <a href="/evaluation/supervisor">Auswertung nach Betreuern</a>
		<hr>
		<table id="praxis">
			<tr><th>Firma</th><th>Student</th><th>Betreuer</th><th>Firmenbetreuer</th><th>Zeitraum</th></tr>
			<%
				print(data_o)
			%>
			%for element in data_o['offer']:
				%if element['status_s'] == 'abgeschlossen':
					<%	
						if data_o['offer'].index(element) != '':
							dataIndex = int(data_o['offer'].index(element))
						endif
						if data_o['offer'][data_o['offer'].index(element)]['studentID_s'] != '':
							studentIndex = int(data_o['offer'][data_o['offer'].index(element)]['studentID_s'])
						endif
						if data_o['offer'][data_o['offer'].index(element)]['betreuerID_s'] != '':
							tutorIndex = int(data_o['offer'][data_o['offer'].index(element)]['betreuerID_s'])
						endif
						if data_o['offer'][data_o['offer'].index(element)]['firmaID_s'] != '':
							firmaIndex = int(data_o['offer'][data_o['offer'].index(element)]['firmaID_s'])
						endif
						print(element)

					%>
					<tr id="r${data_o['offer'].index(element)}">
						<td>${data_o['company'][firmaIndex]['firmenname_s']}</td>
						<td>${data_o['student'][studentIndex]['name_s']}</td>
						<td>${data_o['tutor'][tutorIndex]['name_s']}</td>
						<td>${data_o['offer'][dataIndex]['firmenbetreuer_s']}</td>
						<td>${data_o['offer'][dataIndex]['von_s']} - ${data_o['offer'][dataIndex]['bis_s']}</td>
					</tr>
				%endif
			% endfor
		</table>
		<hr>
			Praxisphasen (aktuell)
			<a href="/evaluation/student">Auswertung nach Studenten</a> - <a href="/evaluation/supervisor">Auswertung nach Betreuern</a>
		<hr>
		<table id="praxis">
			<tr><th>Firma</th><th>Student</th><th>Betreuer</th><th>Firmenbetreuer</th><th>Zeitraum</th></tr>
			<%
				print(data_o)
			%>
			%for element in data_o['offer']:
				%if element['status_s'] == 'aktuell':
					<%	
						if data_o['offer'].index(element) != '':
							dataIndex = int(data_o['offer'].index(element))
						endif
						if data_o['offer'][data_o['offer'].index(element)]['studentID_s'] != '':
							studentIndex = int(data_o['offer'][data_o['offer'].index(element)]['studentID_s'])
						endif
						if data_o['offer'][data_o['offer'].index(element)]['betreuerID_s'] != '':
							tutorIndex = int(data_o['offer'][data_o['offer'].index(element)]['betreuerID_s'])
						endif
						if data_o['offer'][data_o['offer'].index(element)]['firmaID_s'] != '':
							firmaIndex = int(data_o['offer'][data_o['offer'].index(element)]['firmaID_s'])
						endif
						print(element)

					%>
					<tr id="r${data_o['offer'].index(element)}">
						<td>${data_o['company'][firmaIndex]['firmenname_s']}</td>
						<td>${data_o['student'][studentIndex]['name_s']}</td>
						<td>${data_o['tutor'][tutorIndex]['name_s']}</td>
						<td>${data_o['offer'][dataIndex]['firmenbetreuer_s']}</td>
						<td>${data_o['offer'][dataIndex]['von_s']} - ${data_o['offer'][dataIndex]['bis_s']}</td>
					</tr>
				%endif
			% endfor
		</table>
		<hr>
			Praxisphasen (angebot)
			<a href="/evaluation/student">Auswertung nach Studenten</a> - <a href="/evaluation/supervisor">Auswertung nach Betreuern</a>
		<hr>
		<table id="praxis">
			<tr><th>Firma</th><th>Student</th><th>Betreuer</th><th>Firmenbetreuer</th><th>Zeitraum</th></tr>
			<%
				print(data_o)
			%>
			%for element in data_o['offer']:
				%if element['status_s'] == 'angebot':
					<%	
						if data_o['offer'].index(element) != '':
							dataIndex = int(data_o['offer'].index(element))
						endif
						if data_o['offer'][data_o['offer'].index(element)]['studentID_s'] != '':
							studentIndex = int(data_o['offer'][data_o['offer'].index(element)]['studentID_s'])
						endif
						if data_o['offer'][data_o['offer'].index(element)]['betreuerID_s'] != '':
							tutorIndex = int(data_o['offer'][data_o['offer'].index(element)]['betreuerID_s'])
						endif
						if data_o['offer'][data_o['offer'].index(element)]['firmaID_s'] != '':
							firmaIndex = int(data_o['offer'][data_o['offer'].index(element)]['firmaID_s'])
						endif
						print(element)

					%>
					<tr id="r${data_o['offer'].index(element)}">
						<td>${data_o['company'][firmaIndex]['firmenname_s']}</td>
						<td>${data_o['student'][studentIndex]['name_s']}</td>
						<td>${data_o['tutor'][tutorIndex]['name_s']}</td>
						<td>${data_o['offer'][dataIndex]['firmenbetreuer_s']}</td>
						<td>${data_o['offer'][dataIndex]['von_s']} - ${data_o['offer'][dataIndex]['bis_s']}</td>
					</tr>
				%endif
			% endfor
		</table>
		<div>
			<br><a href="/index.html">Startseite</a>
		</div>
	</body>
	</html>



