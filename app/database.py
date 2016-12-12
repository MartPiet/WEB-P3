# coding: utf-8
import os
import os.path
import codecs
import json
import operator
import string
import random

#----------------------------------------------------------
class Database_cl(object): 
#----------------------------------------------------------
	# da es hier nur darum geht, die Daten dauerhaft zu speichern,
	# wird ein sehr einfacher Ansatz verwendet:
	# - es können Daten zu genau 15 Teams gespeichert werden
	# - je Team werden 2 Teilnehmer mit Namen, Vornamen, Matrikelnummer und 
	# Semester berücksichtigt
	# - die Daten werden als eine JSON-Datei abgelegt
	
	#-------------------------------------------------------
	def __init__(self): 
	#-------------------------------------------------------
		self.data_o = None
		self.additionalData_o = None
		#self.readData_p('student')
		self.currentEntity = None

	def id_generator(self):
	   return ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(6))

	def defaultStudentEntry(self):
		return {'studID_s': 'student' + self.id_generator(), 'name_s': '', 'vorname_s': '', 'matrnr_s': ''}
	
	def defaultTutorEntry(self):
		return {'tutorID_s': 'tutor' + self.id_generator(), 'titel_s': '', 'name_s': '', 'vorname_s': '', 'lehrgebiet_s': ''}	

	def defaultCompanyEntry(self):
		return {'companyID_s': 'company' + self.id_generator(), 'firmenname_s': '', 'branche_s': '', 'taetigschw_s': '', 'sitz_s': '', 'anzMitarbeiter_s': ''}
    
	def defaultOfferEntry(self):
		return {'offerID_s': 'offer' + self.id_generator(), 'companyID_s': '', 'tutorID_s': '', 'studID_s': '', 'beschreibung_s': '', 'voraussetzungen_s': '', 'firmenbetreuer_s': '', 'von_s': '', 'bis_s': '', 'status_s': 'angebot'}

	#-------------------------------------------------------
	def create_px(self, data_opl, entity): 
	#-------------------------------------------------------
	# Überprüfung der Daten müsste ergänzt werden!

		id_s = None

		self.appendEntry(entity, data_opl)
		id_s = len(self.data_o) - 1

		return id_s

	#-------------------------------------------------------
	def appendEntry(self, entity, data_opl): 
	#-------------------------------------------------------
		self.data_o.append(data_opl)
		self.saveData_p(entity)

	#-------------------------------------------------------
	def read_px(self, entity, id_spl = None): 
	#-------------------------------------------------------
	# hier zur Vereinfachung:
	# Aufruf ohne id: alle Einträge liefern 
		if self.currentEntity != entity:
			self.readData_p(entity)

		data_o = {}
		if id_spl is None:
			data_o = self.data_o 
		elif int(id_spl) < len(self.data_o) and int(id_spl) >= 0:
			data_o = self.data_o[int(id_spl)]
			self.currentEntity = entity				
		return data_o	

	#-------------------------------------------------------
	def getEntryByID(self, id_spl, idTag, entity): 
	#-------------------------------------------------------
		if self.currentEntity != entity:
			self.readData_p(entity)
		for element in self.data_o:
			print("element[idTag]: " + str(element[idTag]))
			if element[idTag] == id_spl:
				return element

	#-------------------------------------------------------
	def getStudentsWithoutEnrollment(self): 
	#-------------------------------------------------------
	# hier zur Vereinfachung:
	# Aufruf ohne id: alle Einträge liefern 
		offers = self.read_px('offer')
		students = self.read_px('student')
		filteredStudents = []
		keylist = []

		if self.currentEntity != 'student':
			self.readData_p(entity)

		for element in offers:
			if element['studID_s'] != '':
				keylist.append(element['studID_s'])

		for student in students:
			if student['studID_s'] not in keylist:
				filteredStudents.append(student)

		return filteredStudents	

	#-------------------------------------------------------
	def update_px(self, id_spl, data_opl, entity): 
	#-------------------------------------------------------
   		# Überprüfung der Daten müsste ergänzt werden!
   		self.readData_p(entity)
		status_b = False
		if int(id_spl) < len(self.data_o) and int(id_spl) >= 0:
			print("saved.")
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
				self.cascadeCompany(self.data_o[int(id_spl)])
			elif entity == 'student':
				self.cascadeStudent(self.data_o[int(id_spl)])
			self.data_o.remove(self.data_o[int(id_spl)])
			self.saveData_p(entity)
			status_b = True

		return status_b

	#-------------------------------------------------------
	def cascadeCompany(self, entry):
	#-------------------------------------------------------
		self.read_px('offer')

		for element in self.data_o:
			if 'companyID_s' in element:
				if element['companyID_s'] == entry['companyID_s']:
					self.data_o.remove(element)
					self.saveData_p('offer')
		self.read_px('company')

	#-------------------------------------------------------
	def cascadeStudent(self, id_spl):
	#-------------------------------------------------------
		self.read_px('offer')
		for element in self.data_o:
			if 'studentID_s' in element:
				if element['status_s'] != 'angebot' and element['studID_s'] == entry['studID_s']:
					self.data_o.remove(element)
					self.saveData_p('offer')
		self.read_px('student')

	#-------------------------------------------------------
	def getDefault_px(self, entity): 
	#-------------------------------------------------------
		entities = {'student' : self.defaultStudentEntry,
			   		'tutor' : self.defaultTutorEntry,
			  		'company' : self.defaultCompanyEntry,
		           	'offer': self.defaultOfferEntry,
		           	'offers': self.defaultOfferEntry
					}	
		
		return entities[entity]() 
	
	#-------------------------------------------------------
	def readData_p(self, entity): 
	#-------------------------------------------------------

		self.currentEntity = entity
		try:
			'''file_o = codecs.open(os.path.join('data', entity + '.json'), 'r', 'utf-8') warum geht diese versio nicht?!
			fp_o = file_o.read()
			print('file: ', str(fp_o))
			file_o.close()'''
			file_o = open(os.path.join('data', entity + '.json'), 'r')
			fp_o = json.load(file_o)
			file_o.close()
		except:
			# Datei neu anlegen 
			print(str(entity) + ' neu anlegen.')
			self.data_o = []
			self.saveData_p(entity) 
				
		else:
			self.data_o = fp_o
		return self.data_o

	#-------------------------------------------------------
	def getSortedList_p(self, entity, key, dataSort = None): 
	#-------------------------------------------------------
		tmpData = []
		if dataSort == None:
			self.readData_p(entity)
			tmpData = self.data_o
		else:
			tmpData = dataSort

		keylist = []
		tmpList = []

		for element in tmpData:
			if element[key] != 0:
				keylist.append(element[key])
		keylist.sort()

		#tmpdict.append where data_o

		for listkey in keylist:
			for element in tmpData:
				if element[key] == listkey:
					tmpList.append(element)
					break

		return tmpList

	#-------------------------------------------------------
	def getIndexOfItem_p(self, entity, key, value):
	#-------------------------------------------------------
		self.readData_p(entity)
		for element in self.data_o:
			if element[key] == value:
				return self.data_o.index(element)

	#-------------------------------------------------------
	def getIDs_p(self, entity, key): 
	#-------------------------------------------------------
		self.readData_p(entity)
		keylist = []
		for element in self.data_o:
			if element[key] != 0:
				keylist.append(element[key])

		return keylist


	#-------------------------------------------------------
	def saveData_p(self, entity): 
	#-------------------------------------------------------
		with codecs.open(os.path.join('data', entity + '.json'), 'w', 'utf-8') as fp_o: 
			json.dump(self.data_o, fp_o, indent=4)
# EOF







