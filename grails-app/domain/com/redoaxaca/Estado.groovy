package com.redoaxaca

class Estado {
	String nombre
	
	static hasMany = [municipios: Municipio]

    static constraints = {
		nombre(blank:false)
    }
	
	String toString() {
		"${nombre}"
	}
}
