package com.redoaxaca

class ObjetoException extends RuntimeException {
	String message
	Objeto objeto
}

class ObjetoService {
	boolean transactional = true
	Objeto crearObjeto(String noInventario, String descripcionTipo) {		
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
