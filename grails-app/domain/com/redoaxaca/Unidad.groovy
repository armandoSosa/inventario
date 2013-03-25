package com.redoaxaca

class Unidad {


	String unidad

    static constraints = {
    }
	
	static hasMany = [caracteristicas : Caracteristica]
	
	String toString() {
		"${unidad}"
	}
}
