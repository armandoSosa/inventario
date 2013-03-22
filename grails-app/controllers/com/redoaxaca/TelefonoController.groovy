package com.redoaxaca

class TelefonoController {
	def scaffold = true
    def index = {
		redirect(action: list)
	}
}
