package com.redoaxaca

class Nivel {
	String nivel
	
	static hasMany= [puestos: Puesto]

    static constraints = {
		nivel(nullable:false, unique:true)
    }
	
	String toString() {
		"${nivel}"
	}
}
