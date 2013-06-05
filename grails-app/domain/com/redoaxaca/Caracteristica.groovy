package com.redoaxaca

class Caracteristica {
	
	String caracteristica

    static constraints = {
		caracteristica(nullable: false)
    }
	
	static belongsTo = [unidad: Unidad]
	static hasMany = [plantillas : Plantilla, caracteristicaUnidad: CaracteristicaUnidad]
	
	String toString() {
		"${caracteristica}"
	}
}
