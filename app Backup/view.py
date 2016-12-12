# coding: utf-8
# sehr einfache Erzeugung des Markups für vollständige Seiten
# jeweils 3 Abschnitte:
# - begin
# - content
# - end
# bei der Liste wird der content-Abschnitt wiederholt
# beim Formular nicht

import codecs
import os.path
import string
import json

from mako.template import Template
from mako.lookup import TemplateLookup

#----------------------------------------------------------
class View_cl(object): 
#----------------------------------------------------------

	#-------------------------------------------------------
	def __init__(self): 
	#-------------------------------------------------------
		self.path_s = os.path.join('', 'templates')
		self.lookup_o = TemplateLookup(directories=[self.path_s])	

	#-------------------------------------------------------
	def create_p(self, template_spl, data_opl):
	#-------------------------------------------------------
		# Auswertung mit templates
		template_o = self.lookup_o.get_template(template_spl)
		print("KEYS: ")
		print(len(data_opl))
		if 'offer' in data_opl:
			return template_o.render(data_o = data_opl['list'], offer = data_opl['offer']['list'])
		return template_o.render(data_o = data_opl['list'])
	
	#-------------------------------------------------------
	def createList_px(self, data_opl, entity): 
	#-------------------------------------------------------
		return self.create_p(entity + 'List.tpl', data_opl)
    
	#-------------------------------------------------------
	def createForm_p(self, template_spl, data_opl, id_spl, entity): 
	#-------------------------------------------------------	
		template_o = self.lookup_o.get_template(template_spl)
		print("KEYS2: ")
		print(data_opl.keys())
		print(len(data_opl))		
		if 'offer' in data_opl:
			return template_o.render(data_o = data_opl, offer = data_opl['offer']['list'], id_s=id_spl, listform_s = entity)	
		return template_o.render(data_o = data_opl, id_s=id_spl, listform_s = entity)
	
	#-------------------------------------------------------
	def createForm_px(self, id_spl, data_opl, entity): 
	#-------------------------------------------------------
		return self.createForm_p(entity + 'Form.tpl', data_opl, id_spl, entity)

# EOF
