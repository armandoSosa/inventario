package com.redoaxaca

class ObjetoDepartamentoController {
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
	
	def save_objeto_departamento(){
		def objetoDepartamentoInstance = new ObjetoDepartamento(params)
		objetoDepartamentoInstance.fechaInicio = new Date()
		if (!objetoDepartamentoInstance.save(flush: true)) {
			flash.message = "No se puede asignar el objeto al departamento"
			render(view: "insertar", model: [objetoDepartamentoInstance: objetoDepartamentoInstance])
			return
		}
		redirect(action: "show", id: objetoDepartamentoInstance.id)
	}
	
}
