package com.redoaxaca

class ObjetoDepartamento {
	Date fechaInicio
	Date fechaFin
	
	static belongsTo = [objeto: Objeto, departamento: Departamento]
    
	static constraints = {
		fechaInicio(nullable:false)
		fechaFin(nullable:true)
		departamento(unique:['departamento','objeto'])
    }
	
	String toString() {
		"${objeto}"+" : "+"${departamento}"
	}
}
