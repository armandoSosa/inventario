package com.redoaxaca

class Valor {


	String valor

    static constraints = {
    }

	static belongsTo = [objetos: Objeto, plantilla:Plantilla]
	static hasMany = [objetos: Objeto]
	
	String toString() {
		"${valor}"
	}
}
