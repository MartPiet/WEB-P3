<!-- Template -->
<!-- Navigationsbereich -->
@var loop_i;@
@var tmp = context.length@
@var entity = "tutor"@

<table>
    <tr><th>Titel</th><th>Name</th><th>Vorname</th><th>Lehrgebiet</th></tr>
    @for loop_i = 0; loop_i < context.length; loop_i++@
        @var element = context[loop_i]@
        @if element['name_s'] != ''@
        <tr>
            <td>#element['titel_s']#</td>
            <td>#element['name_s']#</td>
            <td>#element['vorname_s']#</td>
            <td>#element['lehrgebiet_s']#</td>
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