package com.redoaxaca

class PuestoPersona {
	Date fechaInicio
	Date fechaFin
	
	static belongsTo = [persona: Persona, puesto: Puesto]
    static constraints = {
    }
	
	String toString() {
		"${persona} : ${puesto}"
	}
}
