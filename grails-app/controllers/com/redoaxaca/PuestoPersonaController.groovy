package com.redoaxaca

class PuestoPersonaController {
	def scaffold = true
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
	
	def save_puesto_persona(){
		def puestoPersonaInstance = new PuestoPersona(params)
		puestoPersonaInstance.fechaInicio = new Date()
		if (!puestoPersonaInstance.save(flush: true)) {			
			render(view: "insertar", controller: "puesto", model: [puestoPersonaInstance: puestoPersonaInstance])
			return
		}
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'puestoPersona.label', default: 'PuestoPersona'), puestoPersonaInstance.id])
		redirect(action: "show", id: puestoPersonaInstance.id)
	}
}
