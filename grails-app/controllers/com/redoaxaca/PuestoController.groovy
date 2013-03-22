package com.redoaxaca

class PuestoController {
	def scaffold = true
    def index = {
		redirect(action: list)
	}
}
