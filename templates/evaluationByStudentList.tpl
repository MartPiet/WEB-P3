<!-- Template -->
<!-- Navigationsbereich -->
@var loop_i@
@var tmp = context.length@
        <header>
            <a id="evaluation">Allgemeine Auswertung</a> - <a id="evaluationByStudent">Auswertung nach Studenten</a> - <a id="evaluationBySupervisor">Auswertung nach Betreuern</a>
        </header>
        <hr>
            Praxisphasen nach Studenten (aktuell)
        <hr>
        <table id="praxis">
            <tr><th>Student</th><th>Firma</th><th>Betreuer</th><th>Firmenbetreuer</th><th>Zeitraum</th><th>Bescheibung</th></tr>
            @for loop_i = 0; loop_i < context['aktuell'].length; loop_i++@
                @var element = context['aktuell'][loop_i]@
                @if element['status_s'] == 'aktuell'@
                    <tr id="#loop_i#">
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
                    @if element['companyName_s'] != ''@
                        <td>#element['companyName_s']#</td>
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
        <hr>
            Praxisphasen nach Studenten (abgeschlossen)
        <hr>
        <table id="praxis">
        <tr><th>Betreuer</th><th>Firma</th><th>Student</th><th>Firmenbetreuer</th><th>Zeitraum</th><th>Bescheibung</th></tr>
        @for loop_i = 0; loop_i < context['abgeschlossen'].length; loop_i++@
            @var element = context['abgeschlossen'][loop_i]@
            @if element['status_s'] == 'abgeschlossen'@
                <tr id="#loop_i#">
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
                @if element['companyName_s'] != ''@
                    <td>#element['companyName_s']#</td>
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
    <div>
        <br>
        <a href="/index.html">Startseite</a>
    </div>

<!-- EOF -->