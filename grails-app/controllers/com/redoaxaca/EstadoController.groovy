package com.redoaxaca

class EstadoController {
	def scaffold = true
	
	def index = {
		redirect(action: list)
	}
}
