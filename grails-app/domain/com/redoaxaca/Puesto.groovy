package com.redoaxaca

class Puesto {
	String nombre
	
	static belongsTo = [departamento: Departamento, nivel:Nivel]
	
	static hasMany = [puestosPersona: PuestoPersona]
    
	static constraints = {
    }
	
	String toString() {
		"${nombre}"
	}
}
