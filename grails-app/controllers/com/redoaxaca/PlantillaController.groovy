package com.redoaxaca

class PlantillaController {
	def scaffold = true
	def plantillaService
	
    def index = {
		redirect(action: list)
	}

	def insertar = {
		def tipos = Tipo.all
		def caracteristicas = Caracteristica.all
		return [tipos: tipos, caracteristicas: caracteristicas]
	}
	
	def insertarPlantilla = {
		try {
			def nuevaPlantilla = plantillaService.crearPlantilla(params.caracteristicas, params.tipos)
			flash.message = "Plantilla agregada"
		} catch (PlantillaException pe) {
			flash.message = pe.message
		}
		redirect(action: 'list')
	}
	
	
	
}
