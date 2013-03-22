package com.redoaxaca

class TipoPropiedadController {
	def scaffold = true
    def index = {
		redirect(action: list)
	}
}
