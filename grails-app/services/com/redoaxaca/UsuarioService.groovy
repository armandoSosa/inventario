package com.redoaxaca

class UsuarioException extends RuntimeException {
	String message
	Usuario usuario
}

class UsuarioService {
	boolean transactional = true

    Usuario verificarLogin(String usuario, String contrasena) {
		//Buscamos la unidad que se agregar�� a la caracter��stica
		def supuestoUsuario = Usuario.findByUsuario(usuario)
		if (supuestoUsuario && supuestoUsuario.contrasena.equals(contrasena)) {
			return supuestoUsuario
		} else {
			return null
		}
	}

}
