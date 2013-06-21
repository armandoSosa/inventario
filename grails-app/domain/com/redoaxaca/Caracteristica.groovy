package com.redoaxaca

class Caracteristica {
	
	String caracteristica

    static constraints = {
		caracteristica(nullable: false)
    }
	
	static hasMany = [caracteristicaUnidades: CaracteristicaUnidad]
	
	String toString() {
		"${caracteristica}"
	}
}
