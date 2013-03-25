package com.redoaxaca

class Nivel {
	String nivel
	
	static hasMany= [puestos: Puesto]

    static constraints = {
    }
	
	String toString() {
		"${nivel}"
	}
}
