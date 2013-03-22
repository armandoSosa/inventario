package com.redoaxaca

class PersonaController {
	def scaffold = true
    def index = {
		redirect(action: list)
	}
}
