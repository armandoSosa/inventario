package com.redoaxaca

class Persona {	
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
	static belongsTo = [foto: Foto] 
    
	static constraints = {
		numeroEmpleado(blank: false, unique: true)
		nombre(blank: false)
		paterno(blank: false)
		materno(blank: false)
		curp(blank: false, matches: '[A-Z]{4}[0-9]{6}[A-Za-z0-9]{6}[0-9]{2}')				
		rfc(blank: false, matches: '[A-Z]{4}[0-9]{6}[A-Za-z0-9]{3}')
		fechaNacimiento(blank: false)
		email(email:true)				
		telefonos(nullable:true)
		objetosPersona(nullable:true)	
		foto(nullable:true)
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
