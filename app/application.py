# coding: utf-8

import cherrypy
import json
import os
import codecs
import re

from .database import Database_cl
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
    pass

  @cherrypy.expose
  #-------------------------------------------------------
  def templates(self):
  #-------------------------------------------------------
    retVal_o = {
      'templates': {}
    }
    files_a = os.listdir('templates')
    for fileName_s in files_a:
      if fileName_s != '.DS_Store':
        file_o = codecs.open(os.path.join('templates', fileName_s), 'rU', 'utf-8')
        content_s = file_o.read()
        file_o.close()
        retVal_o['templates'][fileName_s] = content_s

    return json.dumps(retVal_o)

  @cherrypy.expose
  #-------------------------------------------------------
  def list(self, entity):
  #-------------------------------------------------------
    return self.createList_p(entity)

  @cherrypy.expose
  #-------------------------------------------------------
  def getData(self, entity, id = None):
  #-------------------------------------------------------
    evaluations = re.compile('evaluation*')
    if evaluations.match(entity):
      data_a = self.evaluation(str(re.sub('evaluation', '',entity)))
    else:
      data_a = self.createList_p(entity) #self.db_o.read_px(entity, id)
    return json.dumps(data_a)

   
  @cherrypy.expose
  #-------------------------------------------------------
  def studentofferslist(self, entity = 'offers'):
  #-------------------------------------------------------
    additionalData_o = {}
    if entity == 'offers':
      additionalData_o['company'] = self.db_o.read_px('company')
      additionalData_o['tutor'] = self.db_o.read_px('tutor')
      data_o = self.db_o.read_px('offer')
    return self.view_o.createList_px(self.createFilteredInternsListData_p('angebot'), entity)

    return self.view_o.createList_px(data_o, entity, additionalData_o)  


  @cherrypy.expose
  #-------------------------------------------------------
  def enroll(self, id, entity = 'offers'):
  #-------------------------------------------------------
    additionalData_o = {}
    if entity == 'offers':
      additionalData_o['company'] = self.db_o.read_px('company')
      additionalData_o['tutor'] = self.db_o.read_px('tutor')
      additionalData_o['student'] = self.db_o.getStudentsWithoutEnrollment()
      additionalData_o['offer'] = self.db_o.read_px('offer')

      data_o = self.db_o.getEntryByID(id, 'offerID_s', 'offer')
      #data_o = self.db_o.read_px("offer", int(id))

      data_o = self.createOfferEntryData_p(additionalData_o, data_o)


    return self.view_o.createForm_px(id, data_o, entity, additionalData_o) 

  @cherrypy.expose
  #-------------------------------------------------------
  def evaluation(self, by = 'evaluation'): 
  #-------------------------------------------------------
    print('by: ' + str(by))
    evaluations = re.compile('evaluation*')
    if by == '':
      return self.createList_p('evaluation')
    elif by == 'ByStudent':
      return self.createList_p('evaluationByStudent')
    elif by == 'BySupervisor':
      return self.createList_p('evaluationBySupervisor')


  @cherrypy.expose
  #-------------------------------------------------------
  def add(self, entity): 
  #-------------------------------------------------------
    return self.createForm_p(entity)

  @cherrypy.expose
  #-------------------------------------------------------
  def edit(self, entity, id): 
  #-------------------------------------------------------
    return self.createForm_p(entity, id)
   
  @cherrypy.expose
  #-------------------------------------------------------
  def save(self, entity, id = None, **data_opl): 
  #-------------------------------------------------------
    # Sichern der Daten: aufgrund der Formularbearbeitung muss
    # eine vollständige HTML-Seite zurückgeliefert werden!
    # data_opl: Dictionary mit den gelieferten key-value-Paaren
    # hier müsste man prüfen, ob die Daten korrekt vorliegen!
    #id_s = data_opl[id]
    data_a = {}
    self.db_o.read_px(entity)
    if entity == "student":
      data_a = {
        'studID_s': data_opl['studID_s'],
        'name_s': data_opl['name_s'],
        'vorname_s': data_opl['vorname_s'],
        'matrnr_s': data_opl['matrnr_s']
      }
    elif entity == "tutor":
      data_a = {
        'tutorID_s': data_opl['tutorID_s'],
        'titel_s': data_opl['titel_s'],
        'name_s': data_opl['name_s'],
        'vorname_s': data_opl['vorname_s'],
        'lehrgebiet_s': data_opl['lehrgebiet_s']
      }
    elif entity == "company":
      data_a = {
        'companyID_s': data_opl['companyID_s'],
        'firmenname_s': data_opl['firmenname_s'],
        'branche_s': data_opl['branche_s'],
        'taetigschw_s': data_opl['taetigschw_s'],
        'sitz_s': data_opl['sitz_s'],
        'anzMitarbeiter_s': data_opl['anzMitarbeiter_s']
      }
    elif entity == "offer" or entity == "offers":
      data_a = {
        'offerID_s': data_opl['offerID_s'],
        'companyID_s': data_opl['companyID_s'],
        'beschreibung_s': data_opl['beschreibung_s'],
        'voraussetzungen_s': data_opl['voraussetzungen_s'],
        'tutorID_s': data_opl['tutorID_s'],
        'firmenbetreuer_s': data_opl['firmenbetreuer_s'],
        'von_s': data_opl['von_s'],
        'bis_s': data_opl['bis_s'],
        'studID_s': data_opl['studID_s'],
        'status_s': data_opl['status_s']
      }
      
    if str(id) != str(None):
      # Update-Operation
      if entity == 'offers':
        self.db_o.update_px(self.db_o.getIndexOfItem_p('offer', 'offerID_s', id), data_a, 'offer')
      else:
        self.db_o.update_px(id, data_a, entity)
    else:
      # Create-Operation
      id = self.db_o.create_px(data_a, entity) 

    '''if entity == "offers":
      return self.enroll(id)
    else:
      return self.createForm_p(entity, id)'''
      

  
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
   
  @cherrypy.expose
  #-------------------------------------------------------
  def createList_p(self, entity, additionalData_o = None): 
  #-------------------------------------------------------
    data_o = []
    if entity == 'offer':
      print('CreateList (offer)')
      data_o = []
      data_o = self.createFilteredInternsListData_p('angebot')
    elif entity == 'evaluation':
      data_o = {}
      data_o['company'] = self.db_o.getSortedList_p('company', 'firmenname_s')
      data_o['tutor'] = self.db_o.getSortedList_p('tutor', 'name_s')
      data_o['student'] = self.db_o.getSortedList_p('student', 'name_s')
      data_o['aktuell'] = self.createFilteredInternsListData_p('aktuell')
      data_o['abgeschlossen'] = self.createFilteredInternsListData_p('abgeschlossen')
    elif entity == 'evaluationByStudent':
      data_o = {}
      data_o['aktuell'] = self.createFilteredInternsListData_p('aktuell', 'studName_s')
      data_o['abgeschlossen'] = self.createFilteredInternsListData_p('abgeschlossen', 'studName_s')
    elif entity == 'evaluationBySupervisor':
      data_o = {}
      data_o['aktuell'] = self.createFilteredInternsListData_p('aktuell', 'tutor_s')
      data_o['abgeschlossen'] = self.createFilteredInternsListData_p('abgeschlossen', 'tutor_s')

    else:
      data_o = self.db_o.read_px(entity)

    print("data_o bevor rendering: " + str(data_o))
    return data_o

  #-------------------------------------------------------
  def createFilteredInternsListData_p(self, status = 'angebot', sortedBy = None): 
  #-------------------------------------------------------  
    additionalData_o = {}
    additionalData_o['company'] = self.db_o.read_px('company')

    additionalData_o['tutor'] = self.db_o.read_px('tutor')
    additionalData_o['student'] = self.db_o.read_px('student')
    data_o = self.db_o.read_px('offer')
    listData_o = []

    if status == 'aktuell' or status == 'abgeschlossen':
      data_o = self.db_o.getSortedList_p('offer', 'von_s', data_o)

    for element in data_o:
      if element['status_s'] == status:
        listData_o.append(self.createOfferEntryData_p(additionalData_o, element))


    if sortedBy == 'studName_s' or sortedBy == 'tutor_s':
      listData_o = self.db_o.getSortedList_p('offer', sortedBy, listData_o)

    return listData_o

  #-------------------------------------------------------
  def createOfferEntryData_p(self, additionalData_o, element): 
  #------------------------------------------------------- 
    tutorName = ''  
    tutorTitel = ''
    for tutor in additionalData_o['tutor']:
      if tutor['tutorID_s'] == element['tutorID_s']:
        tutorName = tutor['name_s']
        tutorTitel = tutor['titel_s']
          
    companyName = ''
    for company in additionalData_o['company']:
      if company['companyID_s'] == element['companyID_s']:
        companyName = company['firmenname_s']

    studName = ''
    for stud in additionalData_o['student']:
      if stud['studID_s'] == element['studID_s']:
        studName = stud['name_s'] 
          
    data_a = {
      'offerID_s': element['offerID_s'],
      'companyID_s': element['companyID_s'],
      'tutorID_s': element['tutorID_s'],
      'studID_s': element['studID_s'],
      'companyName_s': companyName,
      'beschreibung_s': element['beschreibung_s'],
      'voraussetzungen_s': element['voraussetzungen_s'],
      'tutor_s': tutorName,
      'tutorTitel_s': tutorTitel,
      'studName_s' : studName,
      'firmenbetreuer_s': element['firmenbetreuer_s'],
      'status_s': element['status_s'],
      'von_s': element['von_s'],
      'bis_s': element['bis_s']
    }


    return data_a

  #-------------------------------------------------------
  def createForm_p(self, entity, id_spl = None): 
  #-------------------------------------------------------
    additionalData_o = {}
    if entity == 'offer':
      additionalData_o['company'] = self.db_o.read_px('company')
      additionalData_o['tutor'] = self.db_o.read_px('tutor')

    if id_spl != None:
      data_o = self.db_o.read_px(entity, int(id_spl))
    else:
      data_o = self.db_o.getDefault_px(entity)

    return self.view_o.createForm_px(id_spl, data_o, entity, additionalData_o) 

# EOF
