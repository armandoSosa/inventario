package com.redoaxaca

class TipoUsuario {
	
	String tipo
	
	static hasMany = [usuarios : Usuario, privilegioTipoUsuarios: PrivilegioTipoUsuario]

    static constraints = {
    }
	
	String toString() {
		"${tipo}"
	}
}
