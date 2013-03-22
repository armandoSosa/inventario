package com.redoaxaca

class Caracteristica {
	
	String caracteristica
	
    static constraints = {
    }
	
	static belongsTo = [unidad: Unidad]
	static hasMany = [plantillas : Plantilla]
	
	String toString() {
		"${caracteristica}"
	}
}
