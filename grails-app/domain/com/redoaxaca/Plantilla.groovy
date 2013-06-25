package com.redoaxaca

class Plantilla {
	int orden
	
    static constraints = {
		
    }
	
	static hasMany = [valores: Valor]
	static belongsTo = [tipo:Tipo, caracteristicaUnidad: CaracteristicaUnidad]
	
	
	String toString() {
		"${tipo}"+" : "+"${caracteristicaUnidad}"
	}

}
