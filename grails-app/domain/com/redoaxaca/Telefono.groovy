package com.redoaxaca

class Telefono {
	String telefono
	Date fecha

	static belongsTo = [persona: Persona, tipoTelefono: TipoTelefono]

    static constraints = {		
		telefono(size:10..10)
    }
	
	String toString() {
		"${telefono}"
	}
}
