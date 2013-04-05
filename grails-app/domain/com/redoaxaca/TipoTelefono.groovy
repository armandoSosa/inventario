package com.redoaxaca

class TipoTelefono {
	String tipo
	
	static hasMany = [telefonos: Telefono]
    static constraints = {
		tipo(nullable:false)
    }
	
	String toString() {
		"${tipo}"
	}
}
