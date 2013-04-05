package com.redoaxaca

class NivelController {
	def scaffold = true

    def index() {
		redirect(action:"list")
	}
	
	def listar = {
	}

	def modificar = {
	
	}
	
	def eliminar = {
	
	}
	
	def insertar = {
	
	}
	
	def save_nivel = {
		def nivelInstance = new Nivel(params)
		if (!nivelInstance.save(flush: true)) {
			flash.message = "No se puede crear el nivel"
			render(view: "insertar", controller: "puesto", model: [nivelInstance: nivelInstance])
			return
		}
		redirect(action: "insertar", controller: "puesto", model: [nivelInstance: nivelInstance])
	}
}
