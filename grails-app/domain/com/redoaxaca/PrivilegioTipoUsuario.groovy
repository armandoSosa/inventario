package com.redoaxaca

class PrivilegioTipoUsuario {
	
	static belongsTo = [privilegios: Privilegio, tipoUsuarios:TipoUsuario]

    static constraints = {	
		
    }
}
