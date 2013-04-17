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
	List telefonos = new ArrayList()
	List objetosPersona = new ArrayList()
	
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
		telefonos(nullable:false)
		objetosPersona(nullable:true)
    }
		
	/*
	static mapping = {
		foto column:"foto", sqlType: "blob"
	}*/
	
	static mapping = {
		telefonos cascade:"all-delete-orphan"		
	}
 
	def getTelefonosList() {
		return LazyList.decorate(
			  telefonos,
			  FactoryUtils.instantiateFactory(Telefono.class))
	}
	
	def getObjetosPersonaList() {
		return LazyList.decorate(
			  objetosPersona,
			  FactoryUtils.instantiateFactory(ObjetosPersona.class))
	}
	
	String toString() {
		"${numeroEmpleado}: "+"${nombre} " + "${paterno} " + "${materno} " 
	}
}
