package com.redoaxaca

class TipoTelefono {
	String tipo
	
	static hasMany = [telefonos: Telefono]
    static constraints = {
    }
	
	String toString() {
		"${tipo}"
	}
}
