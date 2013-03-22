package com.redoaxaca

class Privilegio {
	
	String tipo
	
	static hasMany = [tipoUsuarios: TipoUsuario]
	
    static constraints = {
    }
	
	String toString() {
		"${tipo}"
	}
}
