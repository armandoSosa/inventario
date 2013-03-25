package com.redoaxaca

class Tipo {


	String descripcion
	static hasMany = [objetos: Objeto, plantilla : Plantilla]
			
    static constraints = {
    }
	
	String toString() {
		"${descripcion}"
	}
	
}
