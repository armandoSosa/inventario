package com.redoaxaca

class PersonaException extends RuntimeException {
	String message
	Objeto objeto
}

class PersonaService {

    boolean transactional = true
	Objeto crearPersona() {		
		def	tipo = Tipo.findByDescripcion(descripcionTipo)
		if (tipo) {
			def objeto = new Objeto(noInventario: noInventario)	
			tipo.addToObjetos(objeto)
			if (tipo.save()) {
				return objeto
			} else {
				throw new ObjetoException(message: "Objeto inválido o vacio", tipo: tipo)
			}			
		}
	}
}
