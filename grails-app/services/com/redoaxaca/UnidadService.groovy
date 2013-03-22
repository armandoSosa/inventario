package com.redoaxaca


class UnidadException extends RuntimeException {
	String message
	Unidad unidad
}

class UnidadService {
	boolean transactional = true
    
	Unidad crearUnidad(String descripcion) {
		def unidadNueva = new Unidad(unidad: descripcion)
		if (unidadNueva.save()) {
			return unidadNueva
		} else {
			throw new UnidadException(message: "Unidad vacía o inválida", unidadNueva: unidadNueva)
		}
	}
}
