package com.redoaxaca

class TipoController {
	
	def tipoService
	def scaffold = true

    def index = {
		redirect(action: list)
	}
	
	def insertar = {		
		
	}
	
	def insertarTipo = {
		try {
			def newTipo = tipoService.crearTipo(params.descripcion)					
			flash.message = "Tipo: '${params.descripcion}' agregado"
		} catch (TipoException pe) {
			render {		
				div(class:"errors", pe.message)		
			}
		}
		redirect(action: list)
	}
}
