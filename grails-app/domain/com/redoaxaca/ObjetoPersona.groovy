package com.redoaxaca

class ObjetoPersona {
	Date fechaInicio
	Date fechaFin
	int index
	boolean deleted
	static transients = [ 'deleted' ]
	
	
	static mapping = {
		index column:"telefono_index"
	}
	
	static belongsTo = [objeto: Objeto, persona: Persona]
    static constraints = {
		fechaInicio(nullable:false)
		fechaFin(nullable:true)
		persona(unique:['persona','objeto'])
    }
	
	String toString() {
		"${objeto}"+" : "+"${persona}"
	}
}