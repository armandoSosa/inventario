package com.redoaxaca

class Departamento {
	String nombre
	static hasMany = [departamentos: Departamento, puestos: Puesto, objetosDepartamento: ObjetoDepartamento]
    static constraints = {
    }
	
	String toString() {
		"${nombre}"
	}
}
