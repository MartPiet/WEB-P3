<!-- Template -->
<!-- Navigationsbereich -->
@var loop_i;@
@var tmp = context.length@
@var entity = "offer"@

<table>
    <tr><th>Firma</th><th>Beschreibung</th><th>Voraussetzungen</th><th>Betreuer</th><th>Firmenbetreuer</th></tr>
    @for loop_i = 0; loop_i < context.length; loop_i++@
        @var element = context[loop_i]@
        <tr>
            <td>#element['companyName_s']#</td>
            <td>#element['beschreibung_s']#</td>
            <td>#element['voraussetzungen_s']#</td>
            <td>#element['tutor_s']#</td>
            <td>#element['firmenbetreuer_s']#</td>
        </tr>
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