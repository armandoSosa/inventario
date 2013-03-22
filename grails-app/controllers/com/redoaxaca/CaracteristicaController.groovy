package com.redoaxaca

class CaracteristicaController {
	def caracteristicaService
	def scaffold = true
    
	def index = {
		redirect(action: list)
	}
	
	def insertar = {
		def unidades = Unidad.all
		return [unidades: unidades]
	}
	
	def insertarCaracteristica = {
		try {
			def nuevaCaracteristica = caracteristicaService.crearCaracteristica(params.caracteristica, params.unidad)
			flash.message = "Característica agregada: ${nuevaCaracteristica.caracteristica}"
		} catch (CaracteristicaException pe) {
			flash.message = pe.message
		}
		redirect(action: 'list')
	}
}
