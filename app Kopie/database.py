# coding: utf-8
import os
import os.path
import codecs
import json

#----------------------------------------------------------
class Database_cl(object): 
#----------------------------------------------------------
	# da es hier nur darum geht, die Daten dauerhaft zu speichern,
	# wird ein sehr einfacher Ansatz verwendet:
	# - es können Daten zu genau 15 Teams gespeichert werden
	# - je Team werden 2 Teilnehmer mit Namen, Vornamen, Matrikelnummer und 
	# Semester berücksichtigt
	# - die Daten werden als eine JSON-Datei abgelegt
	
	
	def defaultStudentEntry(self):
		return {'name_s': '', 'vorname_s': '', 'matrnr_s': ''}
	
	def defaultTutorEntry(self):
		return {'titel_s': '', 'name_s': '', 'vorname_s': '', 'lehrgebiet_s': ''}	

	def defaultCompanyEntry(self):
		return {'firmenname_s': '', 'branche_s': '', 'taetigschw_s': '', 'sitz_s': '', 'anzMitarbeiter_s': ''}
    
	def defaultOfferEntry(self):
		return {'firmaID_s': '0', 'studentID_s': '', 'beschreibung_s': '', 'voraussetzungen_s': '', 'betreuerID_s': '0', 'firmenbetreuer_s': '', 'von_s': '', 'bis_s': '', 'status_s': 'angebot'}
	
	#-------------------------------------------------------
	def __init__(self): 
	#-------------------------------------------------------
		self.data_o = None
		self.additionalData_o = None
		self.readData_p('student')
		self.currentEntity = 'student'
	#-------------------------------------------------------
	def create_px(self, data_opl, entity): 
	#-------------------------------------------------------
	# Überprüfung der Daten müsste ergänzt werden!
	# 'freien' Platz suchen,
	# falls vorhanden: belegen und Nummer des Platzes als Id zurückgeben

		id_s = None
		print('Loop:')
		print(self.getDefault_px(entity))
		for loop_i in range(0,15):
			print(loop_i)
			print(self.data_o[loop_i])
			if self.data_o[loop_i] == self.getDefault_px(entity): 
				id_s = int(loop_i) 
				self.data_o[id_s] = data_opl 
				self.saveData_p(entity)
				break 

		return id_s
	#-------------------------------------------------------
	def read_px(self, entity, id_spl = None): 
	#-------------------------------------------------------
	# hier zur Vereinfachung:
	# Aufruf ohne id: alle Einträge liefern 
		if self.currentEntity != entity:
			self.readData_p(entity)
		data_o = {}
		if id_spl == None:
			data_o = self.data_o 
		else:
			print('read_px: id_spl')
			print(id_spl)
			if int(id_spl) < len(self.data_o) and int(id_spl) >= 0:
			#if int(id_spl) in self.data_o['list']: 
				data_o = self.data_o[int(id_spl)]
				self.currentEntity = entity				
		return data_o	

	#-------------------------------------------------------
	def update_px(self, id_spl, data_opl, entity): 
	#-------------------------------------------------------
   		# Überprüfung der Daten müsste ergänzt werden!
		status_b = False
		if int(id_spl) < len(self.data_o) and int(id_spl) >= 0:
			self.data_o[int(id_spl)] = data_opl
  			self.saveData_p(entity)
			status_b = True
	
		return status_b

	#-------------------------------------------------------
	def delete_px(self, id_spl, entity):
	#-------------------------------------------------------
		status_b = False
		if int(id_spl) < len(self.data_o) and int(id_spl) >= 0:
			if entity == 'company':
				self.read_px('offer')
				for element in self.data_o:
<<<<<<< HEAD
					if 'firmaID_s' in element:
						if element['firmaID_s'] == id_spl:
=======
					print('Element:')
					print(element)
					if 'firmaID_s' in element:
						if element['firmaID_s'] == id_spl:
							print('true')
							#self.data_o[int(id_spl)] = self.getDefault_px('offer')
>>>>>>> origin/master
							element = self.getDefault_px('offer')
				self.saveData_p('offer')
				self.read_px(entity)
			self.data_o[int(id_spl)] = self.getDefault_px(entity)
			self.saveData_p(entity)
			status_b = True

		return status_b

	#-------------------------------------------------------
	def getDefault_px(self, entity): 
	#-------------------------------------------------------
		entities = {'student' : self.defaultStudentEntry,
			   		'tutor' : self.defaultTutorEntry,
			  		'company' : self.defaultCompanyEntry,
<<<<<<< HEAD
		           	'offer': self.defaultOfferEntry,
		           	'offers': self.defaultOfferEntry
=======
		           	'offer': self.defaultOfferEntry
>>>>>>> origin/master
					}	
		
		return entities[entity]() 
	
	#-------------------------------------------------------
	def readData_p(self, entity): 
	#-------------------------------------------------------
		self.currentEntity = entity
		try:
			file = open(os.path.join('data', entity + '.json'), 'r')
			fp_o = json.load(file)
			file.close()
		except:
			# Datei neu anlegen 
			print('Datei neu anlegen.')
			self.data_o = {}
			entityList = []
			for loop_i in range(0,15):
				entityList.append(self.getDefault_px(entity))
			self.data_o = entityList
			self.saveData_p(entity) 
				
		else:
			print("ELSE")
			self.data_o = fp_o
		return

	#-------------------------------------------------------
	def saveData_p(self, entity): 
	#-------------------------------------------------------
		with codecs.open(os.path.join('data', entity + '.json'), 'w', 'utf-8') as fp_o: 
			json.dump(self.data_o, fp_o, indent=4)
# EOF
