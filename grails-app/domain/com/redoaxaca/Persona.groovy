package com.redoaxaca

class Persona {
	byte[] foto
	String numeroEmpleado
	String nombre
	String paterno
	String materno
	String curp
	String rfc
	Date fechaNacimiento
	String email
	
		
	static hasMany = [subordinado: Persona, objetosPersona: ObjetoPersona, puestosPersona: PuestoPersona, direcciones: Direccion, telefonos: Telefono, usuarios: Usuario]
    
	static constraints = {
		numeroEmpleado(blank: false)
		nombre(blank: false)
		paterno(blank: false)
		materno(blank: false)
		curp(blank: false)
		rfc(blank: false)
		fechaNacimiento(blank: false)
		email(email:true)
		foto(maxSize:1073741824)
    }
	
	String toString() {
		"${nombre} ${paterno} ${materno}"
	}
}
