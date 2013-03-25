package com.redoaxaca

class PrivilegioTipoUsuarioController {

     def scaffold = true
    
	def index = {
		redirect(action: list)
	}
}
