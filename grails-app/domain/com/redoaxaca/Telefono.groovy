package com.redoaxaca

class Telefono {
	String telefono
	
	static belongsTo = [persona: Persona, tipoTelefono: TipoTelefono]

    static constraints = {
    }
	
	String toString() {
		"${telefono}"
	}
}
