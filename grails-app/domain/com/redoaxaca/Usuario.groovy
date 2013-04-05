package com.redoaxaca

class Usuario {
	
	String usuario
	String contrasena
	Date fechaInicio
	Date fechaFin
	
	static belongsTo = [persona: Persona, tipoUsuario: TipoUsuario]

    static constraints = {
		persona(unique:true)
		usuario(blank:false, unique:true)
		contrasena(blank:false)
		fechaInicio(nullable:false)
		fechaFin(nullable:true)
		
    }
	
	String toString() {
		"${usuario}"
	}
}
