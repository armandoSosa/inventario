package com.redoaxaca

class Departamento {
	String nombre
	static hasMany = [departamentos: Departamento, puestos: Puesto, objetosDepartamento: ObjetoDepartamento]
    
	static constraints = {
		nombre(nullable:false, unique:true)
    }
	
	String toString() {
		"${nombre}"
	}
}
