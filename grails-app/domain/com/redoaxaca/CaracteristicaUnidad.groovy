package com.redoaxaca

class CaracteristicaUnidad {
	
    static constraints = {
    	
	}
	static hasMany= [plantillas: Plantilla]
	static belongsTo= [caracteristica: Caracteristica, unidad: Unidad]
}