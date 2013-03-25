package com.redoaxaca

class Privilegio {
	
	String tipo
	
	static hasMany = [privilegioTipoUsuarios: PrivilegioTipoUsuario]
	
    static constraints = {
    }
	
	String toString() {
		"${tipo}"
	}

}
