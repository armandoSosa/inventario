package com.redoaxaca

class Estado {
	String nombre
	
	static hasMany = [municipios: Municipio]

    static constraints = {
		nombre(blank:false, unique:true)
    }
	
	String toString() {
		"${nombre}"
	}
}
