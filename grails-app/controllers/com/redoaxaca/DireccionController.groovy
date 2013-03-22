package com.redoaxaca

class DireccionController {
	def scaffold = true
    def index = {
		redirect(action: list)
	}
}
