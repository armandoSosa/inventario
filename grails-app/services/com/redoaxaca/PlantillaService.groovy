package com.redoaxaca


class PlantillaException extends RuntimeException {
	String message
	Plantilla plantilla
}

class PlantillaService {
	boolean transactional = true
	
	
	Plantilla crearPlantilla(String pCaracteristica, String pTipo) {
		//Buscamos el objeto característica que se agregará a la plantilla
		def caracteristicaObjeto = Caracteristica.findByCaracteristica(pCaracteristica);
		def tipoObjeto = Tipo.findByDescripcion(pTipo)
		
		def plantillaNueva = new Plantilla()
		
		plantillaNueva.setCaracteristica(caracteristicaObjeto)
		plantillaNueva.setTipo(tipoObjeto)
		

		//Guardamos el objeto
		if (plantillaNueva.save()) {
			return plantillaNueva
		} else {
			throw new PlantillaException(message: "Plantilla vacía o inválida ", plantillaNueva: plantillaNueva)
		}
	}
}
