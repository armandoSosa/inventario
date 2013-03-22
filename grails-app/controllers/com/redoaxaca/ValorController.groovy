package com.redoaxaca

class ValorController {
	def scaffold = true
    def index = {
		redirect(action: list)
	}
}
