<!-- Template -->
<!-- Navigationsbereich -->
@var loop_i;@
@var tmp = context.length@
@var entity = "student"@

<table>
   <tr><th>Name</th><th>Vorname</th><th>Matrikelnummer</th></tr>
    @for loop_i = 0; loop_i < context.length; loop_i++@
    	@if context[loop_i]['name_s'] != ''@
        	<tr>
        		<td>#context[loop_i]['name_s']#</td>
        		<td>#context[loop_i]['vorname_s']#</td>
        		<td>#context[loop_i]['matrnr_s']#</td>
        	</tr>
        @endif@
    @endfor@
</table>	
<div>
	<a href="/add/#entity#">Erfassen</a> <!-- Noch ändern! -->
    @if context.length > 0@
        <button class="clEdit">Auswahl bearbeiten</button> 
        <button class="clDelete">Löschen</button> 
   	@endif@
    <a href="/index.html">Startseite</a>
</div>
<!-- EOF -->