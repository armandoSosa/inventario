package com.redoaxaca

class Municipio {
	String nombre
	
	static hasMany = [direcciones: Direccion]
	static belongsTo = [ciudad: Estado]

    static constraints = {
    }
	
	String toString() {
		"${nombre}"
	}
}
