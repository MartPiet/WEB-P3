<!-- Template -->
<!-- Navigationsbereich -->
@var loop_i@
@var tmp = context.length@
        <header>
            <a id="evaluation">Allgemeine Auswertung</a> - <a id="evaluationByStudent">Auswertung nach Studenten</a> - <a id="evaluationBySupervisor">Auswertung nach Betreuern</a>
        </header>
        <hr>
        <table>
            <tr><th>Firma</th><th>Branche</th><th>Tätigkeitsschwerpunkt</th><th>Sitz</th><th>Mitarbeiter</th></tr>
            @for loop_i = 0; loop_i < context['company'].length; loop_i++@
                @if context['company']['firmenname_s'] != ''@
                    <tr id="#loop_i#">
                        <td>#context['company'][loop_i]['firmenname_s']#</td>
                        <td>#context['company'][loop_i]['branche_s']#</td>
                        <td>#context['company'][loop_i]['taetigschw_s']#</td>
                        <td>#context['company'][loop_i]['sitz_s']#</td>
                        <td>#context['company'][loop_i]['anzMitarbeiter_s']#</td>
                    </tr>
                @endif@
            @endfor@
        </table>
        <hr>
            Praxisphasen (aktuell)
        <hr>
        <table id="praxis">
            <tr><th>Firma</th><th>Student</th><th>Betreuer</th><th>Firmenbetreuer</th><th>Zeitraum</th><th>Beschreibung</th></tr>
            @for loop_i = 0; loop_i < context['aktuell'].length; loop_i++@
                @var element = context['aktuell'][loop_i]@
                @if element['status_s'] == 'aktuell'@
                    <tr id="#loop_i#">
                    @if element['companyName_s'] != ''@
                        <td>#element['companyName_s']#</td>
                    @else@
                        <td> - </td>
                    @endif@
                    @if element['studName_s'] != ''@
                        <td>#element['studName_s']#</td>
                    @else@
                        <td> - </td>
                    @endif@
                    @if element['tutor_s'] != ''@
                        <td>#element['tutor_s']#</td>
                    @else@
                        <td> - </td>
                    @endif@
                    @if element['firmenbetreuer_s'] != ''@
                        <td>#element['firmenbetreuer_s']#</td>
                    @else@
                        <td> - </td>
                    @endif@
                    @if element['von_s'] != ''@
                        <td>#element['von_s']# - #element['bis_s']#</td>
                    @endif@
                    @if element['beschreibung_s'] != ''@
                        <td>#element['beschreibung_s']#</td>
                    @else@
                        <td> - </td>
                    @endif@

                    </tr>
                @endif@
            @endfor@
            <hr>
                Praxisphasen (abgeschlossen)
            <hr>
        <table id="praxis">
            <tr><th>Firma</th><th>Student</th><th>Betreuer</th><th>Firmenbetreuer</th><th>Zeitraum</th><th>Beschreibung</th></tr>
            @for element in context['abgeschlossen']@
                @var element = context['abgeschlossen'][loop_i]@
                @if element['status_s'] == 'abgeschlossen'@
                    <tr id="#loop_i#">
                    @if element['companyName_s'] != ''@
                        <td>#element['companyName_s']#</td>
                    @else@
                        <td> - </td>
                    @endif@
                    @if element['studName_s'] != ''@
                        <td>#element['studName_s']#</td>
                    @else@
                        <td> - </td>
                    @endif@
                    @if element['tutor_s'] != ''@
                        <td>#element['tutor_s']#</td>
                    @else@
                        <td> - </td>
                    @endif@
                    @if element['firmenbetreuer_s'] != ''@
                        <td>#element['firmenbetreuer_s']#</td>
                    @else@
                        <td> - </td>
                    @endif@
                    @if element['von_s'] != ''@
                        <td>#element['von_s']# - #element['bis_s']#</td>
                    @endif@
                    @if element['beschreibung_s'] != ''@
                        <td>#element['beschreibung_s']#</td>
                    @else@
                        <td> - </td>
                    @endif@

                    </tr>
                @endif@
            @endfor@
        </table>

<!-- EOF -->