package com.redoaxaca

class PrivilegioController {

    def scaffold = true
    
	def index = {
		redirect(action: list)
	}
}
