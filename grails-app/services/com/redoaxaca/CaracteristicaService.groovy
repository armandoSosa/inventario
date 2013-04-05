package com.redoaxaca


class CaracteristicaException extends RuntimeException {
	String message
	Caracteristica Caracteristica
}

class CaracteristicaService {
	boolean transactional = true
	
	
	Caracteristica crearCaracteristica(String descripcion, String unidadString) {
		//Buscamos la unidad que se agregar�� a la caracter��stica
		def unidadObjeto = Unidad.findByUnidad(unidadString)
		
		def caracteristicaNueva = new Caracteristica(caracteristica: descripcion)
		
		unidadObjeto.addToCaracteristicas(caracteristicaNueva)

		if (unidadObjeto.save()) {
			return caracteristicaNueva
		} else {
			throw new CaracteristicaException(message: "Caracter��stica vac��a o inv��lida ", caracteristicaNueva: caracteristicaNueva)
		}
	}
	
	Caracteristica crearCaracteristica(String descripcion, int unidadId) {
		//Buscamos la unidad que se agregar�� a la caracter��stica
		def unidadObjeto = Unidad.findById(unidadId)
		
		def caracteristicaNueva = new Caracteristica(caracteristica: descripcion)
		unidadObjeto.addToCaracteristicas(caracteristicaNueva)

		if (unidadObjeto.save()) {
			return caracteristicaNueva
		} else {
			throw new CaracteristicaException(message: "Caracter��stica vac��a o inv��lida ", caracteristicaNueva: caracteristicaNueva)
		}
	}
}
