package com.redoaxaca

class Objeto {

	
	String noInventario
	

    static constraints = {
    }
	
	
	static belongsTo = [tipo: Tipo, tipoPropiedad: TipoPropiedad]
	static hasMany = [valores : Valor, objetosPersona: ObjetoPersona, objetosDepartamento: ObjetoDepartamento]
	
	
	String toString() {
		"Numero inventario: ${noInventario}"
	}
	
}