package com.redoaxaca

class DepartamentoController {
	def scaffold = true
    def index = {
		redirect(action: list)
	}
}
