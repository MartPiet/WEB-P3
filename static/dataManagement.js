var tm = new TemplateManager_cl();
var listData = []

function getData(entity, id = undefined) {
	var path_s = "/getData/" + entity + "/";
   var tpl = "List.tpl"

   if (id != undefined) {
      path_s += id
      tpl = "Form.tpl"
   }
      $.ajax({
         dataType: "json",
         url: path_s,
         contentType: "application/json; charset=utf-8",
         type: 'GET',
         context: this
      })
      .done(function (data_opl) {
         this.data = data_opl;
         if (tpl == 'List.tpl') {
            listData = data_opl
         }  
         document.getElementById("mainContent").innerHTML = tm.execute_px(entity + tpl, this.data);
      })
      .fail(function(jqXHR_opl, textStatus_spl) {
         alert( "[dm] Fehler bei Anforderung: " + textStatus_spl );
      });
}

function closeForm(entity) {
   document.getElementById("mainContent").innerHTML = tm.execute_px(entity + "List.tpl", listData);
}


function saveData(entity, id) {
   var path_s = "/save/" + entity + "/" + id;
      $.ajax({
         dataType: "json",
         url: path_s,
         contentType: "application/json; charset=utf-8",
         type: 'PUT',
         context: this
      })
      .done(function (data_opl) {
         this.data = data_opl;
         document.getElementById("mainContent").innerHTML = tm.execute_px(entity + "Form.tpl", this.data);
      })
      .fail(function(jqXHR_opl, textStatus_spl) {
         alert( "[dm] Fehler bei Anforderung: " + textStatus_spl );
      });
}