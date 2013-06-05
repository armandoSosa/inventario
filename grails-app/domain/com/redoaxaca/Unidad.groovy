package com.redoaxaca

class Unidad {


	String unidad

    static constraints = {
    }
	
	static hasMany = [caracteristicas : Caracteristica, caracteristicaUnidad: CaracteristicaUnidad]
	
	String toString() {
		"${unidad}"
	}
}
