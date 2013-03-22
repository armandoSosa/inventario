package com.redoaxaca

class MunicipioController {
	def scaffold = true
    def index = {
		redirect(action: list)
	}
}
