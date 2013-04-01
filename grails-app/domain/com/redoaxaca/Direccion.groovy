package com.redoaxaca

class Direccion {
	String calle
	String colonia
	String noInterior
	String noExterior
	Date fecha
	
	static belongsTo = [persona:Persona, municipio:Municipio]

    static constraints = {
		calle(blank: false)
		colonia(blank: false)	
		noExterior(blank: false)
		fecha(blank: false)
    }
	
	String toString() {
		"${calle}, ${noExterior}, ${noInterior}, ${colonia}, ${municipio}"
	}
}
