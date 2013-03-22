package com.redoaxaca

class ObjetoPersonaController {
	def scaffold = true
	def postService
    def index = {
		redirect(action: list)
	}
	
	
	
	
	def listadoPorPersona = {
		//def objetos = objetos.findByDescripcion(params.id)
		//def variable=params.id

		
		def criterio = ObjetoPersona.createCriteria()
		def objetosPersona = criterio.list {
			persona {
				eq 'numeroEmpleado', params.id
			}
		}
		//Buscamos la información de la persona
		criterio = Persona.createCriteria()
		def persona = criterio.list {
			eq 'numeroEmpleado', params.id
		}
		
		return [ objetosPersona: objetosPersona, persona: persona]
	}
}
