package com.redoaxaca

class Municipio {
	String nombre
	
	static hasMany = [direcciones: Direccion]
	static belongsTo = [estado: Estado]

    static constraints = {
		nombre(blank:false)
    }
	
	String toString() {
		"${nombre}"
	}
}
