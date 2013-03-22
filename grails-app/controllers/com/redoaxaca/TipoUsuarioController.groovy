package com.redoaxaca

class TipoUsuarioController {
	def scaffold = true
    
	def index = {
		redirect(action: list)
	}
}
