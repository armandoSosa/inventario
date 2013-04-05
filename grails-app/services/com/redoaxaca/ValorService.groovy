package com.redoaxaca

class ValorException extends RuntimeException {
	String message
	Valor valorNuevo
}

class ValorService {
    boolean transactional = true

	Valor crearValor(Objeto objeto, String descripcion, int idPlantilla) {
		//Buscamos la plantilla a la que se le agregará el valor
		def plantillaObjeto = Plantilla.findById(idPlantilla)
		System.out.println((plantillaObjeto.caracteristica.caracteristica!=null?plantillaObjeto.caracteristica.caracteristica+" aqui esta la caracteristica":"no se encontro la plantilla"))
		
		def valorNuevo = new Valor(valor: descripcion)
		System.out.println("numero de valoreSSSSSS: "+plantillaObjeto?.valores?.size())
		plantillaObjeto.addToValores(valorNuevo)
		System.out.println("numero de valores: "+plantillaObjeto?.valores?.size())
		if (plantillaObjeto.save()) {
			objeto.addToValores(valorNuevo)
			if(objeto.save()) {
				return valorNuevo
			} else {
				throw new ValorException(message: "Valor vacio o invalido ", valorNuevo: valorNuevo)
			}
			
		} else {
			throw new ValorException(message: "Valor vacio o invalido ", valorNuevo: valorNuevo)
		}
	}
	
	Valor guardarValor(String descripcion, int idPlantilla, Objeto objeto) {
		def b = new Valor(valor:descripcion, plantilla:Plantilla.findById(idPlantilla), objetos: objeto)
		if (!b.save(flush: true)) {
			b.errors.each {
				println it
			}
		} else {
			System.out.println("se agrego el valor")
			return b
		}
	}
}