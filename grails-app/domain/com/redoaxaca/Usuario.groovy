package com.redoaxaca

class Usuario {
	
	String usuario
	String contrasena
	Date fechaInicio
	Date fechaFin
	
	static belongsTo = [persona: Persona, tipoUsuario: TipoUsuario]

    static constraints = {
    }
	
	String toString() {
		"${usuario}"
	}
	
	
}
