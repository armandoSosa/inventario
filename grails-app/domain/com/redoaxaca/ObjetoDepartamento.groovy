package com.redoaxaca

class ObjetoDepartamento {
	Date fechaInicio
	Date fechaFin
	
	static belongsTo = [objeto: Objeto, departamento: Departamento]
    
	static constraints = {
    }
	
	String toString() {
		"${objeto}"+" : "+"${departamento}"
	}
}
