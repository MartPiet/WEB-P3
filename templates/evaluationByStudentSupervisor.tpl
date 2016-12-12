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
			<table id="praxis">
                <tr><th>Firma</th><th>Student</th><th>Betreuer</th><th>Firmenbetreuer</th><th>Status</th></tr>
                %for element in data_o['offer']:
                	%if element['status_s'] != 'angebot':
                    	<%
	    					dataIndex = int(data_o['offer'].index(element))
	    					studentIndex = int(data_o['offer'][data_o['offer'].index(element)]['studentID_s'])
	    					tutorIndex = int(data_o['offer'][data_o['offer'].index(element)]['betreuerID_s'])
	    					firmaIndex = int(data_o['offer'][data_o['offer'].index(element)]['firmaID_s'])
	    					print(element)

						%>
	                    <tr id="r${data_o['offer'].index(element)}">
	                    	<td>${data_o['company'][firmaIndex]['firmenname_s']}</td>
	                    	<td>${data_o['student'][studentIndex]['name_s']}</td>
	                    	<td>${data_o['tutor'][tutorIndex]['name_s']}</td>
	                    	<td>${data_o['offer'][dataIndex]['firmenbetreuer_s']}</td>
	                    	<td>${data_o['offer'][dataIndex]['status_s']}</td>
	                    </tr>
	                %endif
                % endfor
			</table>
		<div>
			<a href="/index.html">Startseite</a>
		</div>
	</body>
</html>



