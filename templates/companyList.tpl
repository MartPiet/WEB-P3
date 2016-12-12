<!-- Template -->
<!-- Navigationsbereich -->
@var loop_i;@
@var tmp = context.length@
@var entity = "company"@

<table>
    <tr><th>Firma</th><th>Branche</th><th>Tätigkeitsschwerpunkt</th><th>Sitz</th><th>Anzahl Mitarbeiter</th></tr>
    @for loop_i = 0; loop_i < context.length; loop_i++@
        @var element = context[loop_i]@
        @if element['firmenname_s'] != ''@
            <tr>
                <td>#element['firmenname_s']#</td>
                <td>#element['branche_s']#</td>
                <td>#element['taetigschw_s']#</td>
                <td>#element['sitz_s']#</td>
                <td>#element['anzMitarbeiter_s']#</td>
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