package com.redoaxaca

class ObjetoPersona {
	Date fechaInicio
	Date fechaFin
	
	static belongsTo = [objeto: Objeto, persona: Persona]
    static constraints = {
		fechaInicio(nullable:false)
		fechaFin(nullable:true)
		//persona(unique:['persona','objeto'])
    }
	
	String toString() {
		"${objeto}"+" : "+"${persona}"
	}
}