package com.redoaxaca

class ObjetoPersona {
	Date fechaInicio
	Date fechaFin
	
	static belongsTo = [objeto: Objeto, persona: Persona]
    static constraints = {
    }
	
	String toString() {
		"${objeto}"+" : "+"${persona}"
	}
}
