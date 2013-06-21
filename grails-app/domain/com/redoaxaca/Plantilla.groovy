package com.redoaxaca

class Plantilla {

    static constraints = {
    }
	
	static hasMany = [valores: Valor]
	static belongsTo = [tipo:Tipo, caracteristicaUnidad: CaracteristicaUnidad]
	
	
	String toString() {
		"${tipo}"+" : "+"${caracteristicaUnidad}"
	}

}
