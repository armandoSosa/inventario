package com.redoaxaca

class PuestoPersona {
	Date fechaInicio
	Date fechaFin
	
	static belongsTo = [persona: Persona, puesto: Puesto]
    static constraints = {
		fechaInicio(nullable:false)
		fechaFin(nullable: true)
		//persona(unique:['persona','puesto'])
    }
	
	String toString() {
		"${persona} : ${puesto}"
	}
}
