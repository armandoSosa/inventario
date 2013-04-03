package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class ObjetoController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def postService
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
	
	
	def listadoTipo = {
		//def objetos = objetos.findByDescripcion(params.id)
		//def variable=params.id
		System.out.println("Ejemplo");

		
		def criterio = Objeto.createCriteria()
		def objetos = criterio.listDistinct {
			valores {
				plantilla {
					tipo {
						eq 'descripcion', params.id
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
	
	def addPlantillasAjax = {
		System.out.print("id: "+params.tipo)
		def criterio = Plantilla.createCriteria()
		def plantillas
		if (criterio) {
			plantillas = criterio.listDistinct {
				tipo {
					eq 'id', Long.parseLong(params.tipo)
				}
			}
			System.out.println("Encontre "+plantillas.size())
			
		} else {
			System.out.println("Problema")
		}
		render (template:'mostrarFormValores', model: [plantillas:plantillas])
	}
	
}




