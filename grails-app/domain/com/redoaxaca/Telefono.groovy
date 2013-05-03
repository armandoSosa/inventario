package com.redoaxaca

class Telefono {
	String telefono
	Date fecha
	int index
	boolean deleted
	static transients = [ 'deleted' ]
	
	
	static mapping = {
		index column:"telefono_index"			
	}
 
	static belongsTo = [persona: Persona, tipoTelefono: TipoTelefono]

    static constraints = {
		tipoTelefono(nullable:true)
    }
	
	String toString() {
		"${telefono}"
	}
}
