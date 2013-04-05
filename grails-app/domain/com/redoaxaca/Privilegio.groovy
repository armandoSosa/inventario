package com.redoaxaca

class Privilegio {
	
	String tipo
	
	static hasMany = [privilegioTipoUsuarios: PrivilegioTipoUsuario]
	
    static constraints = {
		tipo(nullable: false, unique: true)
    }
	  
	String toString() {
		"${tipo}"
	}

}
