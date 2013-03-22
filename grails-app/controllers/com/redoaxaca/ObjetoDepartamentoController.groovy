package com.redoaxaca

class ObjetoDepartamentoController {
	def scaffold = true
    def index = {
		redirect(action: list)
	}
}
