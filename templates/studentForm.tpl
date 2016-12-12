<!-- Template -->
<!-- Navigationsbereich -->
        <form id="idWTForm">
            <input type="hidden" value="#context['studID_s']#" id="studID_s" name="studID_s" /> 
            <div>
                <label for="name_s">Name</label>
                <input type="text" value="#context['name_s']#" id="name_s" name="name_s" required/><br>
                <label for="vorname_s">Vorname</label>
                <input type="text" value="#context['vorname_s']#" id="vorname_s" name="vorname_s" required/><br>
                <label for="matrnr_s">Matrikelnummer</label>
                <input type="text" value="#context['matrnr_s']#" id="matrnr_s" name="matrnr_s" required/>
            </div>
            <div>
                <button class="clSave">Speichern</button>
                <button class="clCancel">Zurück</button>
            </div>
        </form>
<!-- EOF -->