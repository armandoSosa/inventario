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
		numeroEmpleado(blank: false, unique: true)
		nombre(blank: false)
		paterno(blank: false)
		materno(blank: false)
		curp(blank: false)
		rfc(blank: false)
		fechaNacimiento(blank: false)
		email(email:true)		
		foto(nullable: true, maxSize:1048576)
    }
	/*
	static mapping = {
		foto column:"foto", sqlType: "blob"
	}*/
	
	String toString() {
		"${numeroEmpleado}"
	}
}
