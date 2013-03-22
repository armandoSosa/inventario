package com.redoaxaca

class TipoException extends RuntimeException {
	String message
	Tipo tipo
}

class TipoService {
	boolean transactional = true
	Tipo crearTipo(String descripcion) {		
		def tipo = new Tipo(descripcion: descripcion)		
		if (tipo.save()) {
			return tipo
		} else {
			throw new TipoException(message: "Tipo inválido o vacio", tipo: tipo)
		}			
	}
    
}
