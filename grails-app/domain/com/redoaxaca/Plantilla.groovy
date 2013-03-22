package com.redoaxaca

class Plantilla {

    static constraints = {
    }
	
	static belongsTo = [caracteristica: Caracteristica, tipo:Tipo]
	
	String toString() {
		"${tipo}"+" : "+"${caracteristica}"+" : ${caracteristica.unidad}"
	}

}
