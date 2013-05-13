package com.redoaxaca

import java.lang.reflect.InvocationTargetException
import org.springframework.dao.DataIntegrityViolationException

class ObjetoController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def postService
	def tipoService
	def plantillaService
	def valorService
	def caracteristicaService
	def scaffold = true
	def objetoService
	def burningImageService
	

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
			System.out.println("Encontr�� "+plantillas.size())
			
		}		
		return [idTipo : id]
	}
	
	def insertar3(Long id) {
		session['numCaracteristica']="0"
		session['numUnidades']="0"
		session['numTipos']="0"
		session['idTipo'] = 0
		session['mostrarCaracteristicas']=0
		def criterio = Plantilla.createCriteria()
		def plantillas
		if (criterio) {
			plantillas = criterio.listDistinct {
				tipo {
					eq 'id', id
				}
			}
			System.out.println("Encontr�� "+plantillas.size())
			
		}
		return [idTipo : id]
	}
	
	def insertar4(Long id) {
		session['numCaracteristica']="0"
		session['numUnidades']="0"
		session['numTipos']="0"
		session['idTipo'] = 0
		session['mostrarCaracteristicas']=0
		session['mostrarFormValores']="0"
		def criterio = Plantilla.createCriteria()
		def plantillas
		if (criterio) {
			plantillas = criterio.listDistinct {
				tipo {
					eq 'id', id
				}
			}
			System.out.println("Encontr�� "+plantillas.size())
			
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
			System.out.println("Encontr�� "+plantillas.size())
			
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
		
		//Buscamos el objeto que tenga m������s caracter������sticas
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
	
	def save_tipo2()  {
		System.out.println(params)
		session['numTipos']=(Integer.parseInt(params.valor2)+1).toString()
		
		//Buscamos si hay tipos en el que los tres primeros caracteres sean iguales para asignar el n��mero especial de inventario
		def criterio = Tipo.createCriteria()
		

		/*def tipos = criterio.listDistinct {
			like "descripcion", params.tipo1.substring(0, 3)+"%"
		}*/
		def tipos = criterio.listDistinct {
			ilike "descripcion", params.tipo1.substring(0, 3)+"%"
		}
		
		System.out.println("tipos size "+(tipos.size()+1))
		def tipoInstance = new Tipo(descripcion: params.tipo1, noInventarioSeriado: (tipos.size()+1))
		System.out.println("El tama��o que se le agreg�� al tipo es de "+tipoInstance.noInventarioSeriado)
		if (!tipoInstance.save(flush: true)) {
			flash.message = "No se puede agregar el Tipo"
			render(view: "forma2")
			return
		}
		tipoInstance = Tipo.findByDescripcion(params.tipo1)
		session['idTipo'] = tipoInstance.id
		System.out.println("paso y tipo es: "+session['idTipo'])
		render(controller:"objeto", template: "forma2")
	}
	
	def save_tipo3()  {
		System.out.println(params)
		session['numTipos']=(Integer.parseInt(params.valor2)+1).toString()
		session['mostrarFormValores']=(Integer.parseInt(params.mostrarFormValores)+1).toString()
		
		//Buscamos si hay tipos en el que los tres primeros caracteres sean iguales para asignar el n��mero especial de inventario
		def criterio = Tipo.createCriteria()
		

		/*def tipos = criterio.listDistinct {
			like "descripcion", params.tipo1.substring(0, 3)+"%"
		}*/
		def tipos = criterio.listDistinct {
			ilike "descripcion", params.tipo1.substring(0, 3)+"%"
		}
		
		System.out.println("tipos size "+(tipos.size()+1))
		def tipoInstance = new Tipo(descripcion: params.tipo1, noInventarioSeriado: (tipos.size()+1))
		System.out.println("El tama��o que se le agreg�� al tipo es de "+tipoInstance.noInventarioSeriado)
		if (!tipoInstance.save(flush: true)) {
			flash.message = "No se puede agregar el Tipo"
			render(view: "forma2")
			return
		}
		tipoInstance = Tipo.findByDescripcion(params.tipo1)
		session['idTipo'] = tipoInstance.id
		System.out.println("paso y tipo es: "+session['idTipo'])
		render(controller:"objeto", template: "forma3")
	}
	
	def addPlantillasAjax = {
		
		def criterio = Plantilla.createCriteria()
		def criterioObjetos = Objeto.createCriteria()
		def plantillas, objetos, mostrarCaracteristicas
		def claveInventario
		
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
		System.out.println("addPlantillasAjax2 "+params)
		def criterio = Plantilla.createCriteria()
		def criterioObjetos = Objeto.createCriteria()
		def plantillas, objetos, mostrarCaracteristicas
		def claveInventario=""
		
		def tipoObj = Tipo.findById(params.tipo1.equals("")?-1:Long.parseLong(params.tipo1))
		System.out.println("recibo: "+params.tipo1)
		
		if (params.tipo1==null) {
			params.tipo1="-1"
		}
		
		if (criterio) {
			
			if (params.tipo1.equals("")) {
				params.tipo1="-1"
				mostrarCaracteristicas=2
				session.setAttribute("mostrarCaracteristicas", 2)
			} else {
				mostrarCaracteristicas=1
			}
			plantillas = criterio.listDistinct {
				tipo {
					eq 'id', Long.parseLong(params.tipo1)
				}
			}
			System.out.println("Encontre "+plantillas.size())
			
			//Definimos el n��mero de inventario de acuerdo al tipo de objeto
			objetos = criterioObjetos.listDistinct {
				tipo {
					eq 'id', Long.parseLong(params.tipo1)
				}
			}
			def numObjetosPorTipo
			if (objetos) {
				def tipoDescripcion=objetos.get(0).tipo.descripcion
				if (tipoDescripcion.length()>=3) {
					claveInventario=tipoDescripcion.substring(0, 3)
				} else {
					claveInventario=tipoDescripcion
				}
				numObjetosPorTipo = (objetos.size()+1).toString() //agregamos m��s uno porque ser�� el nuevo objeto que se agregue
				
			} else {
				System.out.println("Objeto no definido, idTipo: "+params.tipo1)
				//localizamos el tipo del que se trata el objeto
				if (!params.tipo1.equals("-1")) {
					def tipo = Tipo.findById(Long.parseLong(params.tipo1))
					if (tipo.descripcion.length()>=3) {
						claveInventario=tipo.descripcion.substring(0, 3)
					} else {
						claveInventario=tipo.descripcion
					}
					
					numObjetosPorTipo="1"
				}
				
				
				
			}
			
			if (!params.tipo1.equals("-1")) {
				def aux=""
				while (numObjetosPorTipo.length()+aux.length()<5) {
					aux+="0"
				}
				numObjetosPorTipo=aux+numObjetosPorTipo
				claveInventario=claveInventario.toUpperCase()+"-"
				claveInventario+=numObjetosPorTipo+"-"+tipoObj.noInventarioSeriado.toString()
			}
			session.setAttribute("claveInventario", claveInventario)
			System.out.println("numInventario: "+claveInventario)			
		} else {
			mostrarCaracteristicas=2
			session.setAttribute("mostrarCaracteristicas", 2)
			System.out.println("Problema")
		}
		session.setAttribute("idTipo", params.tipo1)

		
		render (template:'mostrarFormValores2', model: [plantillas:plantillas, mostrarCaracteristicas: mostrarCaracteristicas, claveInventario:claveInventario])
	}
	
	
	
	
	def addPlantillasAjax3 = {
		System.out.println("addPlantillasAjax3 "+params)
		def criterio = Plantilla.createCriteria()
		def criterioObjetos = Objeto.createCriteria()
		def plantillas, objetos, mostrarCaracteristicas
		def claveInventario=""
		
		def tipoObj = Tipo.findById(params.tipo1.equals("")?-1:Long.parseLong(params.tipo1))
		System.out.println("recibo: "+params.tipo1)
		
		if (params.tipo1==null) {
			params.tipo1="-1"
		}
		
		if (criterio) {
			
			if (params.tipo1.equals("")) {
				params.tipo1="-1"
				mostrarCaracteristicas=2
				session.setAttribute("mostrarCaracteristicas", 2)
			} else {
				mostrarCaracteristicas=1
			}
			plantillas = criterio.listDistinct {
				tipo {
					eq 'id', Long.parseLong(params.tipo1)
				}
			}
			System.out.println("Encontre "+plantillas.size())
			
			//Definimos el n��mero de inventario de acuerdo al tipo de objeto
			objetos = criterioObjetos.listDistinct {
				tipo {
					eq 'id', Long.parseLong(params.tipo1)
				}
			}
			def numObjetosPorTipo
			if (objetos) {
				def tipoDescripcion=objetos.get(0).tipo.descripcion
				if (tipoDescripcion.length()>=3) {
					claveInventario=tipoDescripcion.substring(0, 3)
				} else {
					claveInventario=tipoDescripcion
				}
				numObjetosPorTipo = (objetos.size()+1).toString() //agregamos m��s uno porque ser�� el nuevo objeto que se agregue
				
			} else {
				System.out.println("Objeto no definido, idTipo: "+params.tipo1)
				//localizamos el tipo del que se trata el objeto
				if (!params.tipo1.equals("-1")) {
					def tipo = Tipo.findById(Long.parseLong(params.tipo1))
					if (tipo.descripcion.length()>=3) {
						claveInventario=tipo.descripcion.substring(0, 3)
					} else {
						claveInventario=tipo.descripcion
					}
					
					numObjetosPorTipo="1"
				}
				
				
				
			}
			
			if (!params.tipo1.equals("-1")) {
				def aux=""
				while (numObjetosPorTipo.length()+aux.length()<5) {
					aux+="0"
				}
				numObjetosPorTipo=aux+numObjetosPorTipo
				claveInventario=claveInventario.toUpperCase()+"-"
				claveInventario+=numObjetosPorTipo+"-"+tipoObj.noInventarioSeriado.toString()
			}
			session.setAttribute("claveInventario", claveInventario)
			System.out.println("numInventario: "+claveInventario)
		} else {
			mostrarCaracteristicas=2
			session.setAttribute("mostrarCaracteristicas", 2)
			System.out.println("Problema")
		}
		session.setAttribute("idTipo", params.tipo1)

		
		render (template:'mostrarFormValores3', model: [plantillas:plantillas, mostrarCaracteristicas: mostrarCaracteristicas, claveInventario:claveInventario])
	}
	
	
	
	def addPlantillasAjaxDescripcion = {
		System.out.println("addPlantillasAjaxDescripcion "+params)
		def criterio = Plantilla.createCriteria()
		def criterioObjetos = Objeto.createCriteria()
		def plantillas, objetos, mostrarCaracteristicas
		def claveInventario
		
		try {
			Thread.sleep(1000);
		} catch(InterruptedException e) {
		
		}
		
		def tipoObj = Tipo.findByDescripcion(params.tipo1)
		System.out.println("localizado tipo: "+(tipoObj?tipoObj.descripcion:"no hay"))
		
		if (params.tipo1==null) {
			params.tipo1=session["idTipo"]
		}
		
		if (criterio) {
			
			if (params.tipo1.equals("")) {
				params.tipo1="-1"
				mostrarCaracteristicas=2
			} else {
				mostrarCaracteristicas=1
			}
			plantillas = criterio.listDistinct {
				tipo {
					eq 'descripcion', params.tipo1
				}
			}
			System.out.println("Encontre "+plantillas.size())
			
			
			//Definimos el n��mero de inventario de acuerdo al tipo de objeto
			objetos = criterioObjetos.listDistinct {
				tipo {
					eq 'descripcion', params.tipo1
				}
			}
			def numObjetosPorTipo
			if (objetos) {
				def tipoDescripcion=objetos.get(0).tipo.descripcion
				if (tipoDescripcion.length()>=3) {
					claveInventario=tipoDescripcion.substring(0, 3)
				} else {
					claveInventario=tipoDescripcion
				}
				
				numObjetosPorTipo = (objetos.size()+1).toString() //agregamos m��s uno porque ser�� el nuevo objeto que se agregue
				
				
				
				
				
			} else {
				System.out.println("Objeto no definido ")
				//localizamos el tipo del que se trata el objeto
				
				
				if (tipoObj.descripcion.length()>=3) {
					claveInventario=tipoObj.descripcion.substring(0, 3)
				} else {
					claveInventario=tipoObj.descripcion
				}
				numObjetosPorTipo="1"
				
				
			}
			
			def aux=""
			while (numObjetosPorTipo.length()+aux.length()<5) {
				aux+="0"
			}
			numObjetosPorTipo=aux+numObjetosPorTipo
			claveInventario=claveInventario.toUpperCase()+"-"
			
			claveInventario+=numObjetosPorTipo+"-"+tipoObj.noInventarioSeriado.toString()
			
			session.setAttribute("claveInventario", claveInventario)
			System.out.println("numInventario: "+claveInventario)
			
		} else {
			mostrarCaracteristicas=2
			System.out.println("Problema")
		}
		session.setAttribute("idTipo", tipoObj.id)
		session['mostrarCaracteristicas']=mostrarCaracteristicas
		System.out.println("mostrarCaracteristicas "+session['mostrarCaracteristicas'])
		render (template:'mostrarFormValores2', model: [plantillas:plantillas, mostrarCaracteristicas: mostrarCaracteristicas, claveInventario:claveInventario])
	}
	
	
	
	
	def addPlantillasAjaxDescripcion2 = {
		System.out.println("addPlantillasAjaxDescripcion "+params)
		def criterio = Plantilla.createCriteria()
		def criterioObjetos = Objeto.createCriteria()
		def plantillas, objetos, mostrarCaracteristicas
		def claveInventario
		
		try {
			Thread.sleep(1000);
		} catch(InterruptedException e) {
		
		}
		
		def tipoObj = Tipo.findByDescripcion(params.tipo1)
		System.out.println("localizado tipo: "+(tipoObj?tipoObj.descripcion:"no hay"))
		
		if (params.tipo1==null) {
			params.tipo1=session["idTipo"]
		}
		
		if (criterio) {
			
			if (params.tipo1.equals("")) {
				params.tipo1="-1"
				mostrarCaracteristicas=2
			} else {
				mostrarCaracteristicas=1
			}
			plantillas = criterio.listDistinct {
				tipo {
					eq 'descripcion', params.tipo1
				}
			}
			System.out.println("Encontre "+plantillas.size())
			
			
			//Definimos el n��mero de inventario de acuerdo al tipo de objeto
			objetos = criterioObjetos.listDistinct {
				tipo {
					eq 'descripcion', params.tipo1
				}
			}
			def numObjetosPorTipo
			if (objetos) {
				def tipoDescripcion=objetos.get(0).tipo.descripcion
				if (tipoDescripcion.length()>=3) {
					claveInventario=tipoDescripcion.substring(0, 3)
				} else {
					claveInventario=tipoDescripcion
				}
				
				numObjetosPorTipo = (objetos.size()+1).toString() //agregamos m��s uno porque ser�� el nuevo objeto que se agregue
				
				
				
				
				
			} else {
				System.out.println("Objeto no definido ")
				//localizamos el tipo del que se trata el objeto
				
				System.out.println(params.tipo1+" "+tipoObj.id)
				
				if (tipoObj.descripcion.length()>=3) {
					claveInventario=tipoObj.descripcion.substring(0, 3)
				} else {
					claveInventario=tipoObj.descripcion
				}
				numObjetosPorTipo="1"
				
				
			}
			
			def aux=""
			while (numObjetosPorTipo.length()+aux.length()<5) {
				aux+="0"
			}
			numObjetosPorTipo=aux+numObjetosPorTipo
			claveInventario=claveInventario.toUpperCase()+"-"
			
			claveInventario+=numObjetosPorTipo+"-"+tipoObj.noInventarioSeriado.toString()
			
			session.setAttribute("claveInventario", claveInventario)
			System.out.println("numInventario: "+claveInventario)
			
		} else {
			mostrarCaracteristicas=2
			System.out.println("Problema")
		}
		session.setAttribute("idTipo", tipoObj.id)
		session['mostrarCaracteristicas']=mostrarCaracteristicas
		System.out.println("mostrarCaracteristicas "+session['mostrarCaracteristicas'])
		render (template:'mostrarFormValores2', model: [plantillas:plantillas, mostrarCaracteristicas: mostrarCaracteristicas, claveInventario:claveInventario])
	}
	
	def listadoTipoAjax = {
		System.out.println("entro ajax "+params.tipo)
		def objetos
		if (!params.tipo.equals("")){
			def criterio = Objeto.createCriteria()
			objetos = criterio.listDistinct {
				tipo {
					eq 'id', Long.parseLong(params.tipo)
				}
			}
		}
		
		
		//Buscamos el objeto que tenga m������s caracter������sticas
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
	
	def buscarPersona = {
		System.out.println("entro ajax "+params.valorABuscar)
		def personas
		if (!params.valorABuscar.equals("")){
			def criterio = Persona.createCriteria()
			personas = criterio.listDistinct {
					ilike ('numeroEmpleado', "%"+params.valorABuscar+"%")
					
			}
		}
		
		render (template:'resultadosBusquedaPersona', model: [ personas: personas])
		
	}
	
	def buscarTipoObjeto = {
		def tipos
		if (!params.valorABuscar.equals("")){
			def criterio = Tipo.createCriteria()
			tipos = criterio.listDistinct {
					ilike ('descripcion', "%"+params.valorABuscar+"%")
					
			}
		}
		
		render (template:'resultadosBusquedaTipoObjeto', model: [ tipos: tipos])
		
	}
	
	def save_caracteristica() {
		System.out.println("entra: "+params.tipo1+params.caracteristica1+params.unidadTexto)
		
		
		if (params.caracteristica1.equals("")) {
		
		} else {
			try {
				def nuevaCaracteristica = caracteristicaService.crearCaracteristica(params.caracteristica1, Integer.parseInt(params.unidadTexto))
				System.out.println(nuevaCaracteristica!=null?nuevaCaracteristica.toString()+" ":"no est�� definida")
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
		System.out.println("entra: "+params+" session unidades antes: "+session['numUnidades'])
		session['numCaracteristica']=(Integer.parseInt(params.valor0)+1).toString()
		session['numUnidades']=(Integer.parseInt(params.valor1)+1).toString()
		
		if (params.caracteristica1.equals("")) {
		
		} else {
			try {
				def nuevaCaracteristica = caracteristicaService.crearCaracteristica(params.caracteristica1, Integer.parseInt(params.unidadTexto))
				System.out.println(nuevaCaracteristica!=null?nuevaCaracteristica.toString()+" ":"no est�� definida")
				save_plantilla2(params.caracteristica1, Integer.parseInt(params.tipo1))
			} catch (CaracteristicaException pe) {
				//flash.message = pe.message
				System.out.println(pe.message)
			}
		}
	}
	
	def save_caracteristica3() {
		System.out.println("save_caracteristica3: "+params+" session unidades antes: "+session['numUnidades'])
		session['numCaracteristica']=(Integer.parseInt(params.valor0)+1).toString()
		session['numUnidades']=(Integer.parseInt(params.valor1)+1).toString()
		session['mostrarFormValores']=(Integer.parseInt(params.mostrarFormValores)+1).toString()
		
		if (params.caracteristica1.equals("")) {
		
		} else {
			try {
				def nuevaCaracteristica = caracteristicaService.crearCaracteristica(params.caracteristica1, Integer.parseInt(params.unidadTexto))
				System.out.println(nuevaCaracteristica!=null?nuevaCaracteristica.toString()+" ":"no est�� definida")
				save_plantilla3(params.caracteristica1, Integer.parseInt(params.tipo1))
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
	
	def save_plantilla3(String caracteristica, int idTipo) {
		try {
			def nuevaPlantilla = plantillaService.crearPlantilla(caracteristica, idTipo)
			plantillasAjax3()
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
					
					eq 'id', (params.tipo instanceof Long?params.tipo:Long.parseLong(params.tipo))
				}
			}
			System.out.println("Encontre "+plantillas.size())
			
		} else {
			mostrarCaracteristicas=2
			System.out.println("Problema")
		}
		
		
		
		session.setAttribute("idTipo", params.tipo)
		
		try {
			Thread.sleep(2000);
		} catch(InterruptedException e) {
		
		}
		
		render (controller: 'objeto', template:'mostrarFormValores2', model: [plantillas:plantillas, mostrarCaracteristicas: mostrarCaracteristicas])
	}
	
	def plantillasAjax3 = {
		
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
		
		try {
			Thread.sleep(2000);
		} catch(InterruptedException e) {
		
		}
		
		render (controller: 'objeto', template:'mostrarFormValores3', model: [plantillas:plantillas, mostrarCaracteristicas: mostrarCaracteristicas])
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
			Objeto newObjeto= objetoService.guardarObjeto(params.noInventario, Long.parseLong(params.tipoPropiedad), Long.parseLong(session['idTipo']))
			if (params.valor0.length()>0) {
				params.valor0 = params.valor0.substring(0, params.valor0.length()-1)
				String[] parametros = params.valor0.split(",")
				System.out.println("parametros size: "+parametros.size()+" " )
				for (int i=0; i<parametros.size(); i++) {
					System.out.println(parametros[i]+" "+params[parametros[i]])
				}
	
				System.out.println(params.noInventario+" "+params.tipoPropiedad+" "+session['idTipo'])
				//creamos el objeto
				
				
				
				
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
			}
			
			System.out.println("se agrego correctamente")
			
			//Agregamos los valores al objeto
			//Objeto newObjeto2= objetoService.asignarValores(nuevosValores, newObjeto)
	
	
			
			session['idTipoDescripcion']=Tipo.findById(Integer.parseInt(session["idTipo"])).descripcion
			return
			
	}
	
	
	
	def save_objeto2 = {
		
			System.out.println(params)
			Objeto newObjeto= objetoService.guardarObjeto(params.noInventario, Integer.parseInt(params.tipoPropiedad), Integer.parseInt(session['idTipo']))
			if (params.valor0.length()>0) {
				params.valor0 = params.valor0.substring(0, params.valor0.length()-1)
				String[] parametros = params.valor0.split(",")
				System.out.println("parametros size: "+parametros.size()+" " )
				for (int i=0; i<parametros.size(); i++) {
					System.out.println(parametros[i]+" "+params[parametros[i]])
				}
	
				System.out.println(params.noInventario+" "+params.tipoPropiedad+" "+session['idTipo'])
				//creamos el objeto
				
				
				
				
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
			}
			
			System.out.println("se agrego correctamente")
			
			//Agregamos los valores al objeto
			//Objeto newObjeto2= objetoService.asignarValores(nuevosValores, newObjeto)
	
	
			
			session['idTipoDescripcion']=Tipo.findById(Integer.parseInt(session["idTipo"])).descripcion
			return
			
	}
	
	def save_objeto3 = {
		
			System.out.println(params)
			
			Objeto newObjeto= objetoService.guardarObjeto(params.noInventario, Long.parseLong(params.tipoPropiedad), params.tipoObjeto)
			if (params.valor0.length()>0) {
				params.valor0 = params.valor0.substring(0, params.valor0.length()-1)
				String[] parametros = params.valor0.split("-")
				System.out.println("parametros size: "+parametros.size()+" " )
				for (int i=0; i<parametros.size(); i++) {
					System.out.println(parametros[i]+" "+params[parametros[i]])
				}
				//creamos el objeto
				
				
				
				
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
			}
			
			System.out.println("se agrego correctamente")
			
			//Agregamos los valores al objeto
			//Objeto newObjeto2= objetoService.asignarValores(nuevosValores, newObjeto)
			return
			
	}
	
	def buscarPer() {
		session.setAttribute("persona", new Persona())
	}
	
	def insertar5() {
		session.setAttribute("tipoObjeto", new Tipo())
	}
	
	def infoPersona(Long id) {
		System.out.println("recibo de numero de empleado: "+id)
		def persona = Persona.findByNumeroEmpleado(id.toString())
		System.out.println("nombre: "+persona.nombre)
		render(template:'infoPersonaEncontrada', model: [personaInstance:persona])		
	}
	
	def mostrarFormCarac(Long id) {
		System.out.println("recibo el id del tipo: "+id)
		
		def criterio = Plantilla.createCriteria()
		def criterioObjetos = Objeto.createCriteria()
		def plantillas, objetos, mostrarCaracteristicas
		def claveInventario=""
		
		def tipoObj = Tipo.findById(id)
		
		plantillas = criterio.listDistinct {
			tipo {
				eq 'id', id
			}
		}
			
		//Definimos el n��mero de inventario de acuerdo al tipo de objeto
		objetos = criterioObjetos.listDistinct {
			tipo {
				eq 'id', id
			}
		}
		def numObjetosPorTipo
		if (objetos) {
			numObjetosPorTipo = (objetos.size()+1).toString() //agregamos m��s uno porque ser�� el nuevo objeto que se agregue
		} else {
			numObjetosPorTipo="1"
		}
			
		def aux=""
		while (numObjetosPorTipo.length()+aux.length()<5) {
			aux+="0"
		}
		numObjetosPorTipo=aux+numObjetosPorTipo
		claveInventario=tipoObj.claveInventario+"-"
		claveInventario+=numObjetosPorTipo+"-"+tipoObj.noInventarioSeriado.toString()
		System.out.println(claveInventario)
		render(template:'mostrarFormCaracteristicas', model: [tipoInstance:tipoObj, plantillas:plantillas, claveInventario:claveInventario])
	}
	
	def renderImage = {
		def user = Persona.findById(params.id)
		if (user?.foto) {
			response.setContentLength(user.foto.length)
			response.outputStream.write(user.foto)
		} else {
			response.sendError(404)
		}
	}
	
	def clic() {
		System.out.println("dio clic")
	}
	
}




