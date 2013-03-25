package com.redoaxaca

class Telefono {
	String telefono
	Date fecha
	
	static belongsTo = [persona: Persona, tipoTelefono: TipoTelefono]

    static constraints = {
    }
	
	String toString() {
		"${telefono}"
	}
}
