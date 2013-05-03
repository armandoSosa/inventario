package com.redoaxaca

class Tipo {


	String descripcion
	int noInventarioSeriado
	String claveInventario
	static hasMany = [objetos: Objeto, plantilla : Plantilla]
			
    static constraints = {
		descripcion(blank: false)
    }
	
	String toString() {
		"${descripcion}"
	}
	
	
	
}
