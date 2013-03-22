package com.redoaxaca

class UnidadController {
	def unidadService
	def scaffold = true
	
    def index = {
		redirect(action: list)
	}
	
	def insertar = {
		
	}
	
	def insertarUnidad = {
		try {
			def nuevaUnidad = unidadService.crearUnidad(params.unidad)
			flash.message = "Unidad agregada: ${nuevaUnidad.unidad}"
		} catch (UnidadException pe) {
			flash.message = pe.message
		}
		redirect(action: 'list')
	}
}
