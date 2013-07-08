package com.redoaxaca

import org.codehaus.groovy.grails.web.json.JSONArray
import org.springframework.dao.DataIntegrityViolationException

class TipoController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def tipoService
	def scaffold = true
	
	def insertar = {
		
	}
	
	def insertar2 = {
		[tipoInstance: new Tipo(params)]
	}
	
	def insertarTipo = {
		try {
			def newTipo = tipoService.crearTipo(params.descripcion)
			flash.message = "Tipo: '${params.descripcion}' agregado"
		} catch (TipoException pe) {
			render {
				div(class:"errors", pe.message)
			}
		}
		redirect(action: list)
	}

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[tipoInstanceList: Tipo.list(params), tipoInstanceTotal: Tipo.count()]
	}
	
	def menu(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[tipoInstanceList: Tipo.list(params), tipoInstanceTotal: Tipo.count()]
	}
	

	def create() {
		[tipoInstance: new Tipo(params)]
	}

	def save() {
		def tipoInstance = new Tipo(params)
		if (!tipoInstance.save(flush: true)) {
			render(view: "create", model: [tipoInstance: tipoInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'tipo.label', default: 'Tipo'), tipoInstance.id])
		redirect (action: "show", id: tipoInstance.id)
	}
	
	def save_tipo() {
		def tipoInstance = new Tipo(descripcion:params.descripcion.toUpperCase())
		System.out.println(params);
		String tipoString = params.descripcion.toUpperCase()
		
		//definimos la clave de inventario
		String claveProbable = tipoString.substring(0, 3);
		while(Tipo.findByClaveInventario(claveProbable)!=null) {
			claveProbable=tipoString.charAt(0)
			claveProbable+=tipoString.charAt((int) Math.random()*(tipoString.length()-1) + 1)
			claveProbable+=tipoString.charAt((int) Math.random()*(tipoString.length()-1) + 1)
		}
		tipoInstance.noInventarioSeriado=0;
		tipoInstance.claveInventario=claveProbable;
		
		if (!tipoInstance.save(flush: true)) {
			render(view: "insertar2", model: [tipoInstance: tipoInstance])
			return
		}
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'tipo.label', default: 'Tipo'), tipoInstance.id])
		redirect(controller:"plantilla", action: "insertar2", id: tipoInstance.id)
	}
	
	def verificarSiExiste() {
		def tipoProbable = Tipo.findByDescripcion(params.tipoTexto.toUpperCase())
		if (tipoProbable) {
			System.out.println("Existe");
			render(controller: "tipo", template: "verificarExistencia", model: [existe: 1])
			return
		} else {
			System.out.println("NO Existe");
			render(controller: "tipo", template: "verificarExistencia", model: [existe: 2])
			return
		}
		
	}

	def show(Long id) {
		def tipoInstance = Tipo.get(id)
		if (!tipoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipo.label', default: 'Tipo'), id])
			redirect(action: "list")
			return
		}

		[tipoInstance: tipoInstance]
	}
	def mostrar(Long id) {
		def tipoInstance = Tipo.get(id)
		
		
		def criterioPlantilla = Plantilla.createCriteria()
		def plantillasOrdenadas = criterioPlantilla.listDistinct {
			tipo { eq 'id', id }
			 order 'orden'
		}
		
		if (!tipoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipo.label', default: 'Tipo'), id])
			redirect(action: "list")
			return
		}

		[tipoInstance: tipoInstance, plantillasOrdenadas:plantillasOrdenadas]
	}

	def edit(Long id) {
		def tipoInstance = Tipo.get(id)
		if (!tipoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipo.label', default: 'Tipo'), id])
			redirect(action: "list")
			return
		}

		[tipoInstance: tipoInstance]
	}

	def update(Long id, Long version) {
		def tipoInstance = Tipo.get(id)
		if (!tipoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipo.label', default: 'Tipo'), id])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (tipoInstance.version > version) {
				tipoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						  [message(code: 'tipo.label', default: 'Tipo')] as Object[],
						  "Another user has updated this Tipo while you were editing")
				render(view: "edit", model: [tipoInstance: tipoInstance])
				return
			}
		}

		tipoInstance.properties = params

		if (!tipoInstance.save(flush: true)) {
			render(view: "edit", model: [tipoInstance: tipoInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'tipo.label', default: 'Tipo'), tipoInstance.id])
		redirect(action: "show", id: tipoInstance.id)
	}

	def delete(Long id) {
		def tipoInstance = Tipo.get(id)
		if (!tipoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipo.label', default: 'Tipo'), id])
			redirect(action: "list")
			return
		}

		try {
			tipoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipo.label', default: 'Tipo'), id])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipo.label', default: 'Tipo'), id])
			redirect(action: "show", id: id)
		}
	}
	
	def verificarExistencia() {
		System.out.println("uno "+params.tipoTexto)
		def tipoProbable = Tipo.findByDescripcion(params.tipoTexto)
		render(controller:"tipo", template: "formAgregarTipo", model: [tipoProbable: tipoProbable])
	}
	
	def insertar3() {
		def tipos = Tipo.executeQuery('select descripcion from Tipo')
		JSONArray arrayTipo=new JSONArray();
		for (String tipo in tipos){
			arrayTipo.put(tipo)
		}
		
		def unidades = Unidad.executeQuery('select unidad from Unidad');
		JSONArray arrayUnidad=new JSONArray();
		for (String unidad in unidades){
			arrayUnidad.put(unidad)
		}
		
		def caracUnidades = CaracteristicaUnidad.list()
		def carac = Caracteristica.executeQuery('select caracteristica from Caracteristica')
		JSONArray arrayCaracUnidad=new JSONArray();
		for (CaracteristicaUnidad cu in caracUnidades) {
			arrayCaracUnidad.put(cu.caracteristica.caracteristica + " ("+cu.unidad.unidad+")")
		}
		for (String c in carac) {
			arrayCaracUnidad.put(c)
		}
		
		[tipos:arrayTipo, caracteristicas:arrayCaracUnidad, unidades:arrayUnidad]
	}
	
	def save_tipo2() {
		System.out.println(params)
		
		//ordenamos los parámetros en función del orden en que deben insertarse las plantillas
		String name, valor
		
		
		if(!params.orden.equals("")) {
			
			
			
			
			ArrayList<Unidad> unidades = new ArrayList<Unidad>()
			ArrayList<Caracteristica> caracteristicas = new ArrayList<Caracteristica>()
			
			
			
			def tipoString = params.tipo.toString().toUpperCase()
			def tipo = Tipo.findByDescripcion(tipoString)
			if(tipo==null) {
				//definimos la clave de inventario
				String claveProbable = tipoString.substring(0, 3);
				while(Tipo.findByClaveInventario(claveProbable)!=null) {
					claveProbable=tipoString.charAt(0)
					claveProbable+=tipoString.charAt((int) Math.random()*(tipoString.length()-1) + 1)
					claveProbable+=tipoString.charAt((int) Math.random()*(tipoString.length()-1) + 1)
				}
				tipo = new Tipo(descripcion:tipoString, claveInventario: claveProbable, noInventarioSeriado:0)
				
				if (!tipo.save(flush: true)) {
					System.out.println("ERROR tipo")
					
					return
				} else {
					System.out.println("tipo guardado")
				}
			}
			
			
			//hay un orden definido
			String[] arrayOrden = params.orden.replaceAll("fila_", "").split(",")
			for (String s in arrayOrden) {
				System.out.println(s)
			}
			System.out.println("termina ")
			int index
			for (int i = 0; i < arrayOrden.length; i++) {
				//Buscamos la caracteristica
				index = params.keySet().toList().indexOf("carac_"+arrayOrden[i])
				valor = params.values().toList().get(index).toString().toUpperCase()
				
				def caracteristica = Caracteristica.findByCaracteristica(valor)
				if (caracteristica==null) {
					caracteristica = new Caracteristica(caracteristica: valor)
					if(caracteristica.save()) {
						System.out.println("se guardo la caracteristica "+caracteristica)
					} else {
						System.out.println("ERROR caracteristica "+caracteristica)
					}
				}
				caracteristicas.add(caracteristica)
				
				//Buscamos la unidad
				
				index = params.keySet().toList().indexOf("unidad_"+arrayOrden[i])
				valor = params.values().toList().get(index).toString().toUpperCase()
				
				def unidad = Unidad.findByUnidad(valor)
				if(unidad==null) {
					unidad = new Unidad(unidad:valor)
					if(unidad.save()) {
						System.out.println("se guardo la unidad "+unidad)
					} else {
						System.out.println("ERROR unidad "+unidad)
					}
				}
				unidades.add(unidad)
				
				//Buscamos si ya existe la caracteristica Unidad
				def caracUnidad = CaracteristicaUnidad.findByCaracteristicaAndUnidad(caracteristica, unidad)
				if (caracUnidad==null) {
					caracUnidad = new CaracteristicaUnidad(caracteristica: caracteristica,unidad: unidad)
					if(caracUnidad.save()) {
						System.out.println("Se ha guardado caracUnidad "+caracUnidad)
					} else {
						System.out.println("ERROR caracUnidad "+caracUnidad)
					}
				}
				
				def plantilla = new Plantilla(tipo: tipo, caracteristicaUnidad: caracUnidad, orden: (i+1))
				
				tipo.addToPlantilla(plantilla)
			}
			
			
			System.out.println("Imprimimos las caracteristicas")
			for (Caracteristica c in caracteristicas){
				System.out.println(c)
			}
			System.out.println("Imprimimos las unidades")
			for (Unidad c in unidades){
				System.out.println(c)
			}
			
			if (!tipo.save(flush: true)) {
				flash.message = message(code: 'Hubo un error al agregar las características')
				render(view: "insertar3", model: [tipoInstance: tipo])
				return
			} else {
				flash.message = message(code: 'Las características se han agregado correctamente')
				redirect(controller:"tipo", action: "mostrar", id: tipo.id)
			}
			
		}
		
		
		
		//Verificamos si el tipo de objeto ya existe
		/*def tipoString = params.tipo.toString().toUpperCase()
		def tipo = Tipo.findByDescripcion(tipoString)
		if(tipo==null) {
			//definimos la clave de inventario
			String claveProbable = tipoString.substring(0, 3);
			while(Tipo.findByClaveInventario(claveProbable)!=null) {
				claveProbable=tipoString.charAt(0)
				claveProbable+=tipoString.charAt((int) Math.random()*(tipoString.length()-1) + 1)
				claveProbable+=tipoString.charAt((int) Math.random()*(tipoString.length()-1) + 1)
			}
			tipo = new Tipo(descripcion:tipoString, claveInventario: claveProbable, noInventarioSeriado:0)
		}
		
		//Identificamos los índices de donde se encuentran los valores
		String name, valor=""
		ArrayList<Orden> ordenadorU = new ArrayList<Orden>()
		ArrayList<Orden> ordenadorC = new ArrayList<Orden>()
		ArrayList<CaracteristicaUnidad> cu = new ArrayList<CaracteristicaUnidad>()
		
		//Buscamos el orden de cada una de las caracteristicas con sus unidades
		
		
		for (int i=0; i<params.keySet().toList().size; i++) {
			name = params.keySet().toList().get(i)
			valor=params.values().toList().get(i).toString().toUpperCase()
			if (name.contains("unidad_")) {
				name = name.replaceAll("unidad_", "")
		
				//Buscamos si la unidad ya existe
				def unidad = Unidad.findByUnidad(valor)
				if(unidad==null) {
					unidad = new Unidad(unidad:valor)
					if(unidad.save()) {
						System.out.println("se guardo la unidad "+unidad)
					} else {
						System.out.println("ERROR unidad "+unidad)
					}
				}
				ordenadorU.add(new Orden(indice: Integer.parseInt(name), valor: unidad))
				
				
				
			} else if(name.contains("carac_")){
				name = name.replaceAll("carac_", "")
				//Buscamos si la característica ya existe
				def caracteristica = Caracteristica.findByCaracteristica(valor)
				if (caracteristica==null) {
					caracteristica = new Caracteristica(caracteristica: valor)
					if(caracteristica.save()) {
						System.out.println("se guardo la caracteristica "+caracteristica)
					} else {
						System.out.println("ERROR caracteristica "+caracteristica)
					}
				}
				ordenadorC.add(new Orden(indice: Integer.parseInt(name), valor: caracteristica))
			}
		}
		System.out.println("unidades: "+ordenadorU.size()+"; caracteristicas: "+ordenadorC.size())
		
		
		
		for(int i=0; i<ordenadorC.size(); i++) {
			//Buscamos la unidad que le corresponde a la caracteristica
			def unidadEncontrada
			for(Orden o in ordenadorU){
				if (o.indice==ordenadorC.get(i).indice){
					unidadEncontrada = o.valor
				}
			}
			
			//Buscamos si ya existe la caracteristicaUnidad que deseamos crear
			def caracUnidad = CaracteristicaUnidad.findByCaracteristicaAndUnidad(ordenadorC.get(i).valor, unidadEncontrada)
			
			//si no existe, la creamos
			if (caracUnidad==null) {
				caracUnidad = new CaracteristicaUnidad(caracteristica: ordenadorC.get(i).valor,unidad: unidadEncontrada)
				if(caracUnidad.save()) {
					System.out.println("Se ha guardado caracUnidad "+caracUnidad)
				} else {
					System.out.println("ERROR caracUnidad "+caracUnidad)
				}
			}
			
			
			
			
			
			
			
			def plantilla = new Plantilla(caracteristicaUnidad: caracUnidad, orden:1)
			
			
			tipo.addToPlantilla(plantilla)
			
		}*/
		
	}
}

class Orden {
	public int indice
	public Object valor
}
