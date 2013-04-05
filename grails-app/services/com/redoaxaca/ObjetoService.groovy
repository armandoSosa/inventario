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
				throw new ObjetoException(message: "Objeto inv��lido o vacio", tipo: tipo)
			}			
		}
	}
	
	Objeto crearObjeto(String noInventario, int idTipoPropiedad, int idTipoObj) {
		def	tipo = Tipo.findById(idTipoObj)
		if (tipo) {
			def objeto = new Objeto(noInventario: noInventario)
			tipo.addToObjetos(objeto)
			if (tipo.save()) {
				//buscamos el tipo de propiedad
				def	tipoPropiedad = TipoPropiedad.findById(idTipoPropiedad)
				tipoPropiedad.addToObjetos(objeto)
				
				if (tipoPropiedad.save()) {
					return objeto
				} else {
					throw new ObjetoException(message: "No se agrego tipoPropiedad", objeto: objeto)
				}
				
			} else {
				throw new ObjetoException(message: "No se agrego tipo", objeto: objeto)
			}
		}
	}
	
	Objeto objeto(String noInventario, int idTipoPropiedad, int idTipoObj) {
		def	tipo = Tipo.findById(idTipo)
		if (tipo) {
			tipo.addToObjetos(objeto)
			if (tipo.save()) {
				return objeto
			} else {
				throw new ObjetoException(message: "Objeto inv��lido o vacio", tipo: tipo)
			}
		}
	}
	
	Objeto guardarObjeto(String noInventario, int idTipoPropiedad, int idTipoObj) {
		def b = new Objeto(noInventario:noInventario, tipoPropiedad:TipoPropiedad.findById(idTipoPropiedad), tipo: Tipo.findById(idTipoObj))
		if (!b.save(flush: true)) {
			b.errors.each {
				println it
			}
		} else {
			System.out.println("se agrego el objeto")
			return b
		}
		
	}
	
	Objeto asignarValores(ArrayList<Valor> valores, Objeto objeto) {
		for (Valor v: valores) {
			objeto.addToValores(v)
		}
		if (!objeto.save(flush: true)) {
			objeto.errors.each {
				println it
			}
		} else {
			System.out.println("se agrego el objeto")
			return objeto
		}
	}
	
	
}
