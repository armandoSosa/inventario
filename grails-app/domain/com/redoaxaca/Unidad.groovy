package com.redoaxaca

class Unidad {


	String unidad

    static constraints = {
    }
	
	static hasMany = [caracteristicaUnidades: CaracteristicaUnidad]
	
	String toString() {
		"${unidad}"
	}
}
