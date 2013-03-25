package com.redoaxaca

class UsuarioController {
	def usuarioService
	def scaffold = true
	
	def index = {
		redirect(action: list)
	}
	
	def login = {
		
	}
	
	def verificarLogin = {
		try {
			def supuestoUsuario = usuarioService.verificarLogin(params.usuario, params.contrasena)
			if (supuestoUsuario) {
				flash.message = "Bienvenido ${supuestoUsuario.persona}"
			} else {
				flash.message = "Usuario y/o contraseña incorrectos"
			}
			
		} catch (CaracteristicaException pe) {
			flash.message = pe.message
		}
		redirect(action: 'list')
	}


}
