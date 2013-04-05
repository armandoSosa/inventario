package com.redoaxaca

class TipoUsuario {
	
	String tipo
	
	static hasMany = [usuarios : Usuario, privilegioTipoUsuarios: PrivilegioTipoUsuario]

    static constraints = {
		tipo(nullable:false, unique:true)
    }
	
	String toString() {
		"${tipo}"
	}
}
