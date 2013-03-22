package com.redoaxaca

class TipoTelefonoController {
	def scaffold = true
    def index = {
		redirect(action: list)
	}
}
