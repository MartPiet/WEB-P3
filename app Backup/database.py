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
		return {'firmaID_s': '', 'beschreibung_s': '', 'voraussetzungen_s': '', 'betreuer_s': ''}
	
	#-------------------------------------------------------
	def __init__(self): 
	#-------------------------------------------------------
		self.data_o = None
		self.data2_o = None
		self.readData_p('student')
		self.currentEntity = 'student'
	#-------------------------------------------------------
	def create_px(self, data_opl, entity): 
	#-------------------------------------------------------
	# Überprüfung der Daten müsste ergänzt werden!
	# 'freien' Platz suchen,
	# falls vorhanden: belegen und Nummer des Platzes als Id zurückgeben

		id_s = None
		for loop_i in range(0,15):
			if self.data_o['list'][loop_i]['name_s'] == '': 
				id_s = int(loop_i) 
				self.data_o['list'][id_s] = data_opl 
				self.saveData_p(entity)
				break 

			return id_s
	#-------------------------------------------------------
	def read_px(self, entity, id_spl = None): 
	#-------------------------------------------------------
	# hier zur Vereinfachung:
	# Aufruf ohne id: alle Einträge liefern 
		#data_o = None
		'''data_o = {}
		if id_spl == None:
			data_o = self.data_o 
		else:
			if int(id_spl) < len(self.data_o['list']) and int(id_spl) > 0: 
				data_o = self.data_o['list'][int(id_spl)]
		return data_o'''
		if self.currentEntity != entity:
			self.readData_p(entity)
		data_o = {}
		if id_spl == None:
			data_o = self.data_o 
		else:
			print('read_px: id_spl')
			print(id_spl)
			if int(id_spl) < len(self.data_o['list']) and int(id_spl) >= 0:
			#if int(id_spl) in self.data_o['list']: 
				print('##########2')
				data_o = self.data_o['list'][id_spl]
				if entity == "offer":
					print("entity == offer")
					file = open(os.path.join('data', 'company.json'), 'r')				
					fp_o = json.load(file)
					data_o["offer"] = fp_o
								
					#print(self.data_o)
							
					self.currentEntity = entity				
		return data_o	

	#-------------------------------------------------------
	def update_px(self, id_spl, data_opl, entity): 
	#-------------------------------------------------------
   		# Überprüfung der Daten müsste ergänzt werden!
		status_b = False
		if int(id_spl) < len(self.data_o['list']) and int(id_spl) >= 0:
			self.data_o['list'][int(id_spl)] = data_opl
  			self.saveData_p(entity)
			status_b = True
	
		return status_b

	#-------------------------------------------------------
	def delete_px(self, id_spl, entity):
	#-------------------------------------------------------
		status_b = False
		if int(id_spl) < len(self.data_o['list']) and int(id_spl) >= 0:
			self.data_o['list'][int(id_spl)] = self.getDefault_px(entity)
			self.saveData_p(entity)
			status_b = True

		return status_b

	#-------------------------------------------------------
	def getDefault_px(self, entity): 
	#-------------------------------------------------------
		print('getDefault entity: ')
		print(entity)
		entities = {'student' : self.defaultStudentEntry,
			   'tutor' : self.defaultTutorEntry,
			   'company' : self.defaultCompanyEntry,
		           'offer': self.defaultOfferEntry
		}	
		
		return entities[entity]() 
	
	#-------------------------------------------------------
	def readData_p(self, entity): 
	#-------------------------------------------------------
		try:
			#fp_o = io.open(os.path.join('data', 'webteams.json'), 'r', 'utf-8')
			#print(codecs.open(os.path.join('data', 'webteams.json'), 'r', 'utf-8'))
			file = open(os.path.join('data', entity + '.json'), 'r')
			fp_o = json.load(file)
			file.close()
		except:
			# Datei neu anlegen 
			print('Datei neu anlegen.')
			self.data_o = {}
			entityList = []
			for loop_i in range(0,15):
				#self.data_o[loop_i] = {'name_s': '', 'vorname_s': '', 'matrnr_s': ''}
				entityList.append(self.getDefault_px(entity))
			self.data_o['list'] = entityList
			self.saveData_p(entity) 
				
		else:
			print("ELSE")
			self.data_o = fp_o
			
			if entity == "offer":
				print("entity == offer")
				file = open(os.path.join('data', 'company.json'), 'r')				
				fp_o = json.load(file)
				self.data_o["offer"] = fp_o
				
				#print(self.data_o)
				
			self.currentEntity = entity
		return

	#-------------------------------------------------------
	def saveData_p(self, entity): 
	#-------------------------------------------------------
		with codecs.open(os.path.join('data', entity + '.json'), 'w', 'utf-8') as fp_o: 
			json.dump(self.data_o['list'], fp_o, indent=4)
# EOF
