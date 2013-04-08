package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class ObjetoController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def postService
	def plantillaService
	def valorService
	def caracteristicaService
	def scaffold = true
	def objetoService

	def insertar = {
		[tipoList : Tipo.list()]
	}
	
	/*def insertar2(Long id) {
		[idTipo : id]
	}*/
	
	def insertar2(Long id) {
		def criterio = Plantilla.createCriteria()
		def plantillas
		if (criterio) {
			plantillas = criterio.listDistinct {
				tipo {
					eq 'id', id
				}
			}
			System.out.println("Encontré "+plantillas.size())
			
		}		
		return [idTipo : id]
	}
	
	def insertar3(Long id) {
		session['numCaracteristica']="0"
		session['numUnidades']="0"
		def criterio = Plantilla.createCriteria()
		def plantillas
		if (criterio) {
			plantillas = criterio.listDistinct {
				tipo {
					eq 'id', id
				}
			}
			System.out.println("Encontré "+plantillas.size())
			
		}
		return [idTipo : id]
	}
	
	def listadoPorTipo() {

	}
	
	def getPlantillas(Long id) {
		def criterio = Plantilla.createCriteria()
		def plantillas
		if (criterio) {
			plantillas = criterio.listDistinct {
				tipo {
					eq 'id', Long.parseLong(params.paramsName)
				}
			}
			System.out.println("Encontré "+plantillas.size())
			
		}
		redirect(action: 'insertar2', params: [ plantillas: plantillas])
	}
	
	
	def menu(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[objetoInstanceList: Objeto.list(params), objetoInstanceTotal: Objeto.count()]
	}
	
	def muestra = {
		
	}
	
	def recibe = {
		
		System.out.println(params.msg);
		System.out.println(params.email);
		//flash.message = params.email

		//redirect(action: 'list')
	}
	
	def resumen = {
		def objetos = Objeto.all
		println "-------------------nueva impresion----------------------"
		if (objetos) {
			objetos.each{
				println it
				it.valores.each{
					println it
					println it.plantilla.caracteristica
					println it.plantilla.tipo
				}
			}
			
		}
		return [ objetos: objetos ]
	}
	
	
	def listadoTipo1 = {
		//def objetos = objetos.findByDescripcion(params.id)
		//def variable=params.id
		System.out.println("Ejemplo");

		
		def criterio = Objeto.createCriteria()
		def objetos = criterio.listDistinct {
			valores {
				plantilla {
					tipo {
						eq 'descripcion', session['idTipoDescripcion']
					}
					
				}
				
			}

		}
		
		//Buscamos el objeto que tenga m��s caracter��sticas
		def Objeto objetoMayor
		if (objetos) {
			System.out.println("hay "+objetos.size()+" objetos")
			def mayor=0
			for (objeto in objetos) {
				if (mayor<objeto.valores.size()) {
					objetoMayor=objeto
					mayor=objetoMayor.valores.size()
				}
			}
		} else {
			System.out.println("no hay objetos")
		}
		
		return [ objetos: objetos , objetoMayor:objetoMayor]
	}

	def index() {
		redirect(action: "list", params: params)
	}
	
	def insertarObjeto = {
		try {
			def newObjeto = objetoService.crearObjeto(params.noInventario, params.descripcion)
			flash.message = "Objeto: '${params.noInventario}' agregado"
		} catch (ObjetoException pe) {
			render {
				div(class:"errors", pe.message)
			}
		}
		redirect(action: list)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[objetoInstanceList: Objeto.list(params), objetoInstanceTotal: Objeto.count()]
	}

	def create() {
		[objetoInstance: new Objeto(params)]
	}

	def save() {
		def objetoInstance = new Objeto(params)
		if (!objetoInstance.save(flush: true)) {
			render(view: "create", model: [objetoInstance: objetoInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'objeto.label', default: 'Objeto'), objetoInstance.id])
		redirect(action: "show", id: objetoInstance.id)
	}

	def show(Long id) {
		def objetoInstance = Objeto.get(id)
		if (!objetoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'objeto.label', default: 'Objeto'), id])
			redirect(action: "list")
			return
		}

		[objetoInstance: objetoInstance]
	}

	def edit(Long id) {
		def objetoInstance = Objeto.get(id)
		if (!objetoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'objeto.label', default: 'Objeto'), id])
			redirect(action: "list")
			return
		}

		[objetoInstance: objetoInstance]
	}

	def update(Long id, Long version) {
		def objetoInstance = Objeto.get(id)
		if (!objetoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'objeto.label', default: 'Objeto'), id])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (objetoInstance.version > version) {
				objetoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						  [message(code: 'objeto.label', default: 'Objeto')] as Object[],
						  "Another user has updated this Objeto while you were editing")
				render(view: "edit", model: [objetoInstance: objetoInstance])
				return
			}
		}

		objetoInstance.properties = params

		if (!objetoInstance.save(flush: true)) {
			render(view: "edit", model: [objetoInstance: objetoInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'objeto.label', default: 'Objeto'), objetoInstance.id])
		redirect(action: "show", id: objetoInstance.id)
	}

	def delete(Long id) {
		def objetoInstance = Objeto.get(id)
		if (!objetoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'objeto.label', default: 'Objeto'), id])
			redirect(action: "list")
			return
		}

		try {
			objetoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'objeto.label', default: 'Objeto'), id])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'objeto.label', default: 'Objeto'), id])
			redirect(action: "show", id: id)
		}
	}
	
	def save_tipo() {
		def tipoInstance = new Tipo(params)
		if (!tipoInstance.save(flush: true)) {
			flash.message = "No se puede agregar el Tipo"
			render(view: "insertar2")
			return
		}

		redirect(action: "insertar2", id: tipoInstance.id)
	}
	
	def save_tipo2() {
		def tipoInstance = new Tipo(params)
		if (!tipoInstance.save(flush: true)) {
			flash.message = "No se puede agregar el Tipo"
			render(view: "insertar3")
			return
		}

		redirect(action: "insertar3", id: tipoInstance.id)
	}
	
	def addPlantillasAjax = {
		
		def criterio = Plantilla.createCriteria()
		def plantillas, mostrarCaracteristicas
		
		if (params.tipo==null) {
			params.tipo=session["idTipo"]
		}
		if (criterio) {
			
			if (params.tipo.equals("")) {
				params.tipo="-1"
				mostrarCaracteristicas=2
			} else {
				mostrarCaracteristicas=1
			}
			plantillas = criterio.listDistinct {
				tipo {
					eq 'id', Long.parseLong(params.tipo)
				}
			}
			System.out.println("Encontre "+plantillas.size())
			
		} else {
			mostrarCaracteristicas=2
			System.out.println("Problema")
		}
		session.setAttribute("idTipo", params.tipo)
		
		render (template:'mostrarFormValores', model: [plantillas:plantillas, mostrarCaracteristicas: mostrarCaracteristicas])
	}
	
	def addPlantillasAjax2 = {
		
		def criterio = Plantilla.createCriteria()
		def plantillas, mostrarCaracteristicas
		
		if (params.tipo==null) {
			params.tipo=session["idTipo"]
		}
		
		if (criterio) {
			
			if (params.tipo.equals("")) {
				params.tipo="-1"
				mostrarCaracteristicas=2
			} else {
				mostrarCaracteristicas=1
			}
			plantillas = criterio.listDistinct {
				tipo {
					eq 'id', Long.parseLong(params.tipo)
				}
			}
			System.out.println("Encontre "+plantillas.size())
			
		} else {
			mostrarCaracteristicas=2
			System.out.println("Problema")
		}
		session.setAttribute("idTipo", params.tipo)
		
		render (template:'mostrarFormValores2', model: [plantillas:plantillas, mostrarCaracteristicas: mostrarCaracteristicas])
	}
	
	def listadoTipoAjax = {
		System.out.println("entro ajax "+params.tipo)
		def objetos
		if (!params.tipo.equals("")){
			def criterio = Objeto.createCriteria()
			objetos = criterio.listDistinct {
				valores {
					plantilla {
						tipo {
							eq 'id', Long.parseLong(params.tipo)
						}
						
					}
					
				}
	
			}
		}
		
		
		//Buscamos el objeto que tenga m��s caracter��sticas
		def Objeto objetoMayor
		if (!params.tipo.equals("") && objetos) {
			System.out.println("hay "+objetos.size()+" objetos")
			def mayor=0
			for (objeto in objetos) {
				if (mayor<objeto.valores.size()) {
					objetoMayor=objeto
					mayor=objetoMayor.valores.size()
				}
			}
		} else {
			System.out.println("no hay objetos")
		}
		
		render (template:'tablaPorTipo', model: [ objetos: objetos , objetoMayor:objetoMayor])
		
	}
	
	def save_caracteristica() {
		System.out.println("entra: "+params.tipo1+params.caracteristica1+params.unidadTexto)
		
		
		if (params.caracteristica1.equals("")) {
		
		} else {
			try {
				def nuevaCaracteristica = caracteristicaService.crearCaracteristica(params.caracteristica1, Integer.parseInt(params.unidadTexto))
				System.out.println(nuevaCaracteristica!=null?nuevaCaracteristica.toString()+" ":"no está definida")
				save_plantilla(params.caracteristica1, Integer.parseInt(params.tipo1))
			} catch (CaracteristicaException pe) {
				flash.message = pe.message
			}
		}
		
		/*if (params.caracteristica1.equals("")) {
			
		} else {
			try {
				def nuevaCaracteristica = caracteristicaService.crearCaracteristica(params.caracteristica1, Integer.parseInt(params.unidadTexto))
				save_plantilla(nuevaCaracteristica, Integer.parseInt(params.tipo1))
			} catch (CaracteristicaException pe) {
				flash.message = pe.message
			}
		}*/
		
		//agregamos la planti
		
		
		/*def caracteristicaInstance = new Caracteristica(params)
		if (!caracteristicaInstance.save(flush: true)) {
			flash.message = "No se puede agregar el la Caracteristica"
			render(view: "insertar2")
			return
		}

		redirect(action: "insertar2", id: caracteristicaInstance.id)*/
	}
	
	def save_caracteristica2() {
		System.out.println("entra: "+params)
		session['numCaracteristica']=(Integer.parseInt(params.valor0)+1).toString()
		session['numUnidades']=(Integer.parseInt(params.valor1)+1).toString()
		
		if (params.caracteristica1.equals("")) {
		
		} else {
			try {
				def nuevaCaracteristica = caracteristicaService.crearCaracteristica(params.caracteristica1, Integer.parseInt(params.unidadTexto))
				System.out.println(nuevaCaracteristica!=null?nuevaCaracteristica.toString()+" ":"no está definida")
				save_plantilla2(params.caracteristica1, Integer.parseInt(params.tipo1))
			} catch (CaracteristicaException pe) {
				//flash.message = pe.message
				System.out.println(pe.message)
			}
		}
	}
	
	def save_plantilla2(String caracteristica, int idTipo) {
		try {
			def nuevaPlantilla = plantillaService.crearPlantilla(caracteristica, idTipo)
			plantillasAjax2()
		} catch (PlantillaException pe) {
			//flash.message = pe.message
			System.out.println(pe.message)
		}

	}
	
	def save_plantilla(String caracteristica, int idTipo) {
		try {
			def nuevaPlantilla = plantillaService.crearPlantilla(caracteristica, idTipo)
			plantillasAjax()
		} catch (PlantillaException pe) {
			flash.message = pe.message
		}

	}
	
	def plantillasAjax = {
		
		def criterio = Plantilla.createCriteria()
		def plantillas, mostrarCaracteristicas
		
		if (params.tipo==null) {
			params.tipo=session["idTipo"]
		}
		if (criterio) {
			
			if (params.tipo.equals("")) {
				params.tipo="-1"
				mostrarCaracteristicas=2
			} else {
				mostrarCaracteristicas=1
			}
			plantillas = criterio.listDistinct {
				tipo {
					eq 'id', Long.parseLong(params.tipo)
				}
			}
			System.out.println("Encontre "+plantillas.size())
			
		} else {
			mostrarCaracteristicas=2
			System.out.println("Problema")
		}
		session.setAttribute("idTipo", params.tipo)
		
		
		render (template:'forma', model: [plantillas:plantillas, mostrarCaracteristicas: mostrarCaracteristicas])
	}
	
	
	
	def plantillasAjax2 = {
		
		def criterio = Plantilla.createCriteria()
		def plantillas, mostrarCaracteristicas
		
		if (params.tipo==null) {
			params.tipo=session["idTipo"]
		}
		if (criterio) {
			
			if (params.tipo.equals("")) {
				params.tipo="-1"
				mostrarCaracteristicas=2
			} else {
				mostrarCaracteristicas=1
			}
			plantillas = criterio.listDistinct {
				tipo {
					eq 'id', Long.parseLong(params.tipo)
				}
			}
			System.out.println("Encontre "+plantillas.size())
			
		} else {
			mostrarCaracteristicas=2
			System.out.println("Problema")
		}
		session.setAttribute("idTipo", params.tipo)
		
		
		render (controller: 'objeto', template:'mostrarFormValores2', model: [plantillas:plantillas, mostrarCaracteristicas: mostrarCaracteristicas])
	}
	
	/*
	def save_objeto = {
	
		System.out.println(params)
		params.valor0 = params.valor0.substring(0, params.valor0.length()-1)
		String[] parametros = params.valor0.split(",")
		
		for (int i=0; i<parametros.size(); i++) {
			System.out.println(parametros[i]+" "+params[parametros[i]])
		}
		//creamos objeto
		def newObjeto = new Objeto(noInventario: params.noInventario)
		System.out.println("se agrego el objeto con los parametros")
		


		//almacenamos valores
		ArrayList<Valor> nuevosValores= new ArrayList()
		for (int i=0; i<parametros.size(); i++) {
			try {
				def newValor = valorService.crearValor(params[parametros[i]], Integer.parseInt(parametros[i].replace("valor","")))
				System.out.println("se agrego valor"+parametros[i].replace("valor","")+": "+params[parametros[i]])
				nuevosValores.add(newValor)
				flash.message = "Valor: '${newValor.valor}' agregado"
			} catch (ObjetoException pe) {
				render {
					div(class:"errors", pe.message)
				}
			}
			
		}
		
		//almacenamos los valores del objeto
		for (Valor v : nuevosValores) {
			newObjeto.addToValores(v)
			System.out.println("valor agregado a objeto")
		}
		
		//guardamos el objeto
		try {
			def newObjeto2 = objetoService.crearObjeto(newObjeto, params.tipoPropiedad)
			System.out.println("objeto agregado")
			flash.message = "Objeto: '${params.noInventario}' agregado"
		} catch (ObjetoException pe) {
			render {
				div(class:"errors", pe.message)
			}
		}
		
		
		redirect(action: list)
		
	}
*/
	
	def save_objeto = {
		
			System.out.println(params)
			params.valor0 = params.valor0.substring(0, params.valor0.length()-1)
			String[] parametros = params.valor0.split(",")
			
			for (int i=0; i<parametros.size(); i++) {
				System.out.println(parametros[i]+" "+params[parametros[i]])
			}

			System.out.println(params.noInventario+" "+params.tipoPropiedad+" "+session['idTipo'])
			//creamos el objeto
			Objeto newObjeto= objetoService.guardarObjeto(params.noInventario, Integer.parseInt(params.tipoPropiedad), Integer.parseInt(session['idTipo']))
			
			
			
			//almacenamos valores
			ArrayList<Valor> nuevosValores= new ArrayList()
			for (int i=0; i<parametros.size(); i++) {
				try {
					def newValor = valorService.guardarValor(params[parametros[i]], Integer.parseInt(parametros[i].replace("valor","")),newObjeto)
					System.out.println("se agrego valor"+parametros[i].replace("valor","")+": "+params[parametros[i]])
					nuevosValores.add(newValor)
					flash.message = "Valor: '${newValor.valor}' agregado"
				} catch (ObjetoException pe) {
					render {
						div(class:"errors", pe.message)
					}
				}
			}
			System.out.println("se agrego correctamente")
			
			//Agregamos los valores al objeto
			//Objeto newObjeto2= objetoService.asignarValores(nuevosValores, newObjeto)
	
	
			
			session['idTipoDescripcion']=Tipo.findById(Integer.parseInt(session["idTipo"])).descripcion
			return
			
		}
	
}




