package com.redoaxaca

class PuestoPersonaController {
	def scaffold = true
    def index = {
		redirect(action: list)
	}
}
