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

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'tipo.label', default: 'Tipo'),
			tipoInstance.id
		])
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

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'tipo.label', default: 'Tipo'),
			tipoInstance.id
		])
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
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tipo.label', default: 'Tipo'),
				id
			])
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
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tipo.label', default: 'Tipo'),
				id
			])
			redirect(action: "list")
			return
		}

		[tipoInstance: tipoInstance, plantillasOrdenadas:plantillasOrdenadas]
	}

	def edit(Long id) {
		def tipoInstance = Tipo.get(id)
		if (!tipoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tipo.label', default: 'Tipo'),
				id
			])
			redirect(action: "list")
			return
		}

		[tipoInstance: tipoInstance]
	}

	def update(Long id, Long version) {
		def tipoInstance = Tipo.get(id)
		if (!tipoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tipo.label', default: 'Tipo'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (tipoInstance.version > version) {
				tipoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'tipo.label', default: 'Tipo')] as Object[],
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

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'tipo.label', default: 'Tipo'),
			tipoInstance.id
		])
		redirect(action: "show", id: tipoInstance.id)
	}

	def delete(Long id) {
		def tipoInstance = Tipo.get(id)
		if (!tipoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'tipo.label', default: 'Tipo'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			tipoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'tipo.label', default: 'Tipo'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'tipo.label', default: 'Tipo'),
				id
			])
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

	def insertar4() {
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

	}

	def save_tipo3() {
		System.out.println(params)
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
		} else if(!params.quitados.equals("")){
			String[] arrayEliminados = params.quitados.split(",")
			def plantillaABorrar
			for(String idString in arrayEliminados) {
				plantillaABorrar = Plantilla.get(Long.parseLong(idString))
				tipo.removeFromPlantilla(plantillaABorrar)
				plantillaABorrar.delete()
			}
		}
		

		//ordenamos los parámetros en función del orden en que deben insertarse las plantillas
		String name, valor
		

		if(!params.orden.equals("")) {
			ArrayList<Unidad> unidades = new ArrayList<Unidad>()
			ArrayList<Caracteristica> caracteristicas = new ArrayList<Caracteristica>()



			
			


			//hay un orden definido
			String ordenString =params.orden.replaceAll("fila_", "")
			while(ordenString.contains(",,")){
				ordenString=ordenString.replaceAll(",,", ",")
			}
			if(ordenString.length()>=1 && ordenString.charAt(ordenString.length()-1).toString().equals(",")){
				ordenString=ordenString.substring(0, ordenString.length())
			}
			if(ordenString.length()>=1 && ordenString.charAt(0).toString().equals(",")){
				ordenString=ordenString.substring(1, ordenString.length())
			}
			String[] arrayOrden = ordenString.split(",")
			System.out.println("--------------------------")
			for (String s in arrayOrden) {
				System.out.println(s)
			}
			System.out.println("--------------------------")
			
			
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

				//Buscamos si la plantilla ya existe
				def plantillaBD = Plantilla.findByTipoAndCaracteristicaUnidad(tipo, caracUnidad)
				if (plantillaBD) {
					plantillaBD.setOrden(i+1)
					if(!plantillaBD.save(flush:true)) {
						System.out.println("ERROR")
					} else {
						System.out.println("se guardó "+plantillaBD+" "+plantillaBD.orden+" orden "+(i+1))
					}
				} else {
					def plantilla = new Plantilla(tipo: tipo, caracteristicaUnidad: caracUnidad, orden: (i+1))
					tipo.addToPlantilla(plantilla)
				}	
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

	}

	def mostrarFormCaracUnidad() {
		System.out.println("entra "+params)
		if (params.tipo.equals("")) {
			render(template: "tablaCaracUnidad")
		} else {
			def tipoObj = Tipo.findByDescripcion(params.tipo.toUpperCase())
			if (tipoObj) {//si el tipo existe, mostramos los campos para que sean editables
				System.out.println("pasa "+tipoObj.id)
				def criterioPlantilla = Plantilla.createCriteria()
				def plantillas = criterioPlantilla.listDistinct {
					tipo { eq 'id', tipoObj.id }
					order 'orden'
				}
				ArrayList<Integer> valores = new ArrayList<Integer>()
				for(Plantilla p in plantillas) {
					valores.add(p.valores.size())
					System.out.println("valores: "+p.valores.size())
				
				}
				render(template: "tablaCaracUnidad", model: [mostrar: "1", plantillas:plantillas, tieneValores: valores])
			} else {
				render(template: "tablaCaracUnidad", model: [mostrar: "1"])
			}
		}
	}
}
