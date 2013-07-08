package com.redoaxaca

class Persona {	
	String numeroEmpleado
	String nombre
	String paterno
	String materno
	String curp
	String rfc
	boolean archivado
	Date fechaNacimiento
	String email	
	List objetosPersona = new ArrayList()
	
	static hasMany = [subordinado: Persona, objetosPersona: ObjetoPersona, puestosPersona: PuestoPersona, direcciones: Direccion, telefonos: Telefono, usuarios: Usuario]	
	static belongsTo = [foto: Foto, sexo: Sexo] 
    
	static constraints = {
		numeroEmpleado(blank: false, unique: true)
		nombre(blank: false)
		paterno(blank: false)
		materno(blank: false)
		fechaNacimiento(blank: false)
		email(email:true)						
		objetosPersona(nullable:true)	
		foto(nullable:true)
		curp(unique:true)
		rfc(unique:true)
    }
	
	static mapping = {
		telefonos cascade:"all-delete-orphan"
	}
		
	/*
	static mapping = {
		foto column:"foto", sqlType: "blob"
	}*/
	def getObjetosPersonaList() {
		return LazyList.decorate(
			  objetosPersona,
			  FactoryUtils.instantiateFactory(ObjetosPersona.class))
	}
	
	String toString() {
		"${numeroEmpleado}: "+"${nombre} " + "${paterno} " + "${materno} " 
	}
}
