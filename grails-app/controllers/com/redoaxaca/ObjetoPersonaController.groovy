package com.redoaxaca

class ObjetoPersonaController {
	def scaffold = true
	def postService
    def index = {
		redirect(action: list)
	}
	
	def listar = {
	}

	def modificar = {
	
	}
	
	def eliminar = {
	
	}
	
	def insertar = {
	
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
	
	def save_objeto_persona(){
		def objetoPersonaInstance = new ObjetoPersona(params)
		objetoPersonaInstance.fechaInicio = new Date()
		if (!objetoPersonaInstance.save(flush: true)) {
			flash.message = "No se puede asignar el objeto a la persona"
			render(view: "insertar", model: [objetoPersonaInstance: objetoPersonaInstance])
			return
		}
		redirect(action: "show", id: objetoPersonaInstance.id)
	}
}
