package com.redoaxaca

class TipoPropiedad {
	String nombre
	static hasMany = [objetos: Objeto]
    static constraints = {
    }
	
	String toString() {
		"${nombre}"
	}
}
