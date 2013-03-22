package com.redoaxaca


class CaracteristicaException extends RuntimeException {
	String message
	Caracteristica Caracteristica
}

class CaracteristicaService {
	boolean transactional = true
	
	
	Caracteristica crearCaracteristica(String descripcion, String unidadString) {
		//Buscamos la unidad que se agregará a la característica
		def unidadObjeto = Unidad.findByUnidad(unidadString);
		
		
		def caracteristicaNueva = new Caracteristica(caracteristica: descripcion)
		
		unidadObjeto.addToCaracteristicas(caracteristicaNueva)

		if (unidadObjeto.save()) {
			return caracteristicaNueva
		} else {
			throw new CaracteristicaException(message: "Característica vacía o inválida ", caracteristicaNueva: caracteristicaNueva)
		}
	}
}
