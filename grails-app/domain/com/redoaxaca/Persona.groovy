package com.redoaxaca

class Persona {
	String numeroEmpleado
	String nombre
	String paterno
	String materno
	String curp
	String rfc
	Date fechaNacimiento
	
		
	static hasMany = [subordinado: Persona, objetosPersona: ObjetoPersona, puestosPersona: PuestoPersona, direcciones: Direccion, telefonos: Telefono]
    
	static constraints = {
    }
	
	String toString() {
		"${nombre} ${paterno} ${materno}"
	}
}
