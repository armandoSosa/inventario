package com.redoaxaca

class TipoUsuario {
	
	String tipo
	
	static hasMany = [usuarios : Usuario]

    static constraints = {
    }
	
	String toString() {
		"${tipo}"
	}
}
