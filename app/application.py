# coding: utf-8

import cherrypy
import json

from database import Database_cl
from view import View_cl

#----------------------------------------------------------
class Application_cl(object): 
#----------------------------------------------------------

  #-------------------------------------------------------
  def __init__(self): 
  #-------------------------------------------------------
    # spezielle Initialisierung können hier eingetragen werden
    self.db_o = Database_cl()
    self.view_o = View_cl()
  
  @cherrypy.expose
  #-------------------------------------------------------
  def index(self):
  #-------------------------------------------------------
    #if listform == 'student':
    #  return self.createList_p()
    #elif listform == 'enumeration':
    #  return self.createEnumeration_p()
    pass
  
  @cherrypy.expose
  #-------------------------------------------------------
  def list(self, entity):
  #-------------------------------------------------------
    return self.createList_p(entity)
   
  @cherrypy.expose
  #-------------------------------------------------------
  def add(self, entity): 
  #-------------------------------------------------------
    return self.createForm_p(entity)

  @cherrypy.expose
  #-------------------------------------------------------
  def edit(self, id, entity): 
  #-------------------------------------------------------
    return self.createForm_p(id, entity)
   
  @cherrypy.expose
  #-------------------------------------------------------
  def save(self, entity, id = None, **data_opl): 
  #-------------------------------------------------------
    # Sichern der Daten: aufgrund der Formularbearbeitung muss
    # eine vollständige HTML-Seite zurückgeliefert werden!
    # data_opl: Dictionary mit den gelieferten key-value-Paaren
    # hier müsste man prüfen, ob die Daten korrekt vorliegen!
    #id_s = data_opl[id]
    
    if entity == "student":
      data_a = {
        'name_s': data_opl['name_s'],
        'vorname_s': data_opl['vorname_s'],
        'matrnr_s': data_opl['matrnr_s']
      }
    elif entity == "tutor":
      data_a = {
        'titel_s': data_opl['titel_s'],
        'name_s': data_opl['name_s'],
        'vorname_s': data_opl['vorname_s'],
        'lehrgebiet_s': data_opl['lehrgebiet_s']
      }
    elif entity == "company":
      data_a = {
        'firmenname_s': data_opl['firmenname_s'],
        'branche_s': data_opl['branche_s'],
        'taetigschw_s': data_opl['taetigschw_s'],
        'sitz_s': data_opl['sitz_s'],
        'anzMitarbeiter_s': data_opl['anzMitarbeiter_s']
      }
    elif entity == "offer":
      print('save:')
      print(data_opl)
      data_a = {
        'firmaID_s': data_opl['firmaID_s'],
        'beschreibung_s': data_opl['beschreibung_s'],
        'voraussetzungen_s': data_opl['voraussetzungen_s'],
        'betreuerID_s': data_opl['betreuer_s'],
      }            

    if id != 'None':
      # Update-Operation
      self.db_o.update_px(id, data_a, entity) 
      
    else:
      # Create-Operation
      id = self.db_o.create_px(data_a, entity) 

    return self.createForm_p(entity, id)
  
  @cherrypy.expose
  #-------------------------------------------------------
  def delete(self, entity, id): 
  #-------------------------------------------------------
    # Eintrag löschen, dann Liste neu anzeigen

    self.db_o.delete_px(id, entity) 
    return self.createList_p(entity)

  @cherrypy.expose
  #-------------------------------------------------------
  def default(self, *arguments, **kwargs): 
  #-------------------------------------------------------
    msg_s = 'unbekannte Anforderung: ' + \
      str(arguments) + \
      ''+ \
      str(kwargs)
    raise cherrypy.HTTPError(404, msg_s)
  default.exposed= True
   
  #-------------------------------------------------------
  def createList_p(self, entity): 
  #-------------------------------------------------------
    additionalData_o = []
    if entity == 'offer':
      additionalData_o = self.db_o.read_px('company')
    data_o = self.db_o.read_px(entity)
    # mit diesen Daten Markup erzeugen 
    return self.view_o.createList_px(data_o, entity, additionalData_o)  
    
  #-------------------------------------------------------
  def createForm_p(self, entity, id_spl = None): 
  #-------------------------------------------------------
    additionalData_o = {}
    if entity == 'offer':
      additionalData_o['company'] = self.db_o.read_px('company')
      additionalData_o['tutor'] = self.db_o.read_px('tutor')
      print('Attitional Data: ')
      print(additionalData_o)
    if id_spl != None:
      data_o = self.db_o.read_px(entity, int(id_spl))
    else:
      data_o = self.db_o.getDefault_px(entity)

    return self.view_o.createForm_px(id_spl, data_o, entity, additionalData_o) 

# EOF
