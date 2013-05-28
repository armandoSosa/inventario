package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class CaracteristicaController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def caracteristicaService
	def unidadService
	def scaffold = true

	def index = { redirect(action: list) }

	def listar(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[caracteristicaInstanceList: Caracteristica.list(params), caracteristicaInstanceTotal: Caracteristica.count()]
	}

	def insertar = {
		def unidades = Unidad.all
		return [unidades: unidades]
	}

	def insertarCaracteristica = {
		try {
			def nuevaCaracteristica = caracteristicaService.crearCaracteristica(params.caracteristica, params.unidad)
			flash.message = "Caracter������stica agregada: ${nuevaCaracteristica.caracteristica}"
		} catch (CaracteristicaException pe) {
			flash.message = pe.message
		}
		redirect(action: 'list')
	}


	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[caracteristicaInstanceList: Caracteristica.list(params), caracteristicaInstanceTotal: Caracteristica.count()]
	}
	
	def menu(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[caracteristicaInstanceList: Caracteristica.list(params), caracteristicaInstanceTotal: Caracteristica.count()]
	}

	def create() {
		[caracteristicaInstance: new Caracteristica(params)]
	}
	
	def insertar2() {
		[caracteristicaInstance: new Caracteristica(params)]
	}

	def save() {
		def caracteristicaInstance = new Caracteristica(params)
		if (!caracteristicaInstance.save(flush: true)) {
			render(view: "create", model: [caracteristicaInstance: caracteristicaInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'caracteristica.label', default: 'Caracteristica'),
			caracteristicaInstance.id
		])
		redirect(action: "show", id: caracteristicaInstance.id)
	}
	def save_caracteristica() {
		def caracteristicaInstance = new Caracteristica(params)
		System.out.println(params)
		if (!caracteristicaInstance.save(flush: true)) {
			render(view: "insertar2", model: [caracteristicaInstance: caracteristicaInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'caracteristica.label', default: 'Caracteristica'),
			caracteristicaInstance.id
		])
		redirect(action: "mostrar", id: caracteristicaInstance.id)
	}

	def show(Long id) {
		def caracteristicaInstance = Caracteristica.get(id)
		if (!caracteristicaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'caracteristica.label', default: 'Caracteristica'),
				id
			])
			redirect(action: "list")
			return
		}

		[caracteristicaInstance: caracteristicaInstance]
	}
	def mostrar(Long id) {
		def caracteristicaInstance = Caracteristica.get(id)
		if (!caracteristicaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'caracteristica.label', default: 'Caracteristica'),
				id
			])
			redirect(action: "menu")
			return
		}

		[caracteristicaInstance: caracteristicaInstance]
	}

	def edit(Long id) {
		def caracteristicaInstance = Caracteristica.get(id)
		if (!caracteristicaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'caracteristica.label', default: 'Caracteristica'),
				id
			])
			redirect(action: "list")
			return
		}

		[caracteristicaInstance: caracteristicaInstance]
	}

	def update(Long id, Long version) {
		def caracteristicaInstance = Caracteristica.get(id)
		if (!caracteristicaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'caracteristica.label', default: 'Caracteristica'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (caracteristicaInstance.version > version) {
				caracteristicaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'caracteristica.label', default: 'Caracteristica')] as Object[],
						"Another user has updated this Caracteristica while you were editing")
				render(view: "edit", model: [caracteristicaInstance: caracteristicaInstance])
				return
			}
		}

		caracteristicaInstance.properties = params

		if (!caracteristicaInstance.save(flush: true)) {
			render(view: "edit", model: [caracteristicaInstance: caracteristicaInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'caracteristica.label', default: 'Caracteristica'),
			caracteristicaInstance.id
		])
		redirect(action: "show", id: caracteristicaInstance.id)
	}

	def delete(Long id) {
		def caracteristicaInstance = Caracteristica.get(id)
		if (!caracteristicaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'caracteristica.label', default: 'Caracteristica'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			caracteristicaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'caracteristica.label', default: 'Caracteristica'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'caracteristica.label', default: 'Caracteristica'),
				id
			])
			redirect(action: "show", id: id)
		}
	}

	def addUnidadAjax = {
		System.out.println("entro")
		if (params.id.equals("1") || params.id.equals("2")) {
			//cancel�� o agreg�� nuevo
			render (template:'forma', model: [agregarUnidad: params.id, caracteristica:params.caracteristica1])
		} else if (params.id.equals("3")){
			//agregamos la unidad
			System.out.println(params.id)
			System.out.println(params.id +" "+params.unidadTexto)

			def nuevaUnidad

			try {
				nuevaUnidad = unidadService.crearUnidad(params.unidadTexto)

			} catch (UnidadException pe) {
				flash.message = pe.message
			}

			render (template:'forma', model: [agregarUnidad: params.id, caracteristica:params.caracteristica1, unidadId:nuevaUnidad.id])

			if (params.id.equals("1")) { //cancel��
				render (template:'forma', model: [agregarUnidad: params.id, municipio:params.idMunicipio])

			} else {

				render (controller:'caracteristica', template:'forma', model: [agregarUnidad: params.id, caracteristica:params.caracteristica1, unidadId:nuevaUnidad.id])
			}
		}
	}
	
	def addUnidadAjax2 = {
		System.out.println("recibeUnidadAjax2: "+params)
		session['numUnidades']=(Integer.parseInt(params.valor1)+1).toString()
		if (params.id.equals("1") || params.id.equals("2")) {
			//cancel�� o agreg�� nuevo
			
			render (controller:'caracteristica', template:'forma2', model: [agregarUnidad: params.id, caracteristica:params['caracteristica1']])
		} else if (params.id.equals("3")){
			
			//agregamos la unidad
			System.out.println(params.id)
			System.out.println(params.id +" "+params.unidadTexto)

			def nuevaUnidad

			try {
				nuevaUnidad = unidadService.crearUnidad(params.unidadTexto)

			} catch (UnidadException pe) {
				flash.message = pe.message
			}
			
			render (controller:'caracteristica', template:'forma2', model: [agregarUnidad: params.id, caracteristica:params.caracteristica1, unidadId:nuevaUnidad.id])
		}
	}
	
	
	def addUnidadAjax3 = {
		System.out.println("recibeUnidadAjax2: "+params)
		session['numUnidades']=(Integer.parseInt(params.valor1)+1).toString()
		if (params.id.equals("1") || params.id.equals("2")) {
			//cancel�� o agreg�� nuevo
			
			render (controller:'caracteristica', template:'forma2', model: [agregarUnidad: params.id, caracteristica:params['caracteristica1']])
		} else if (params.id.equals("3")){
			
			//agregamos la unidad
			System.out.println(params.id)
			System.out.println(params.id +" "+params.unidadTexto)

			def nuevaUnidad

			try {
				nuevaUnidad = unidadService.crearUnidad(params.unidadTexto)

			} catch (UnidadException pe) {
				flash.message = pe.message
			}
			
			render (controller:'caracteristica', template:'forma2', model: [agregarUnidad: params.id, caracteristica:params.caracteristica1, unidadId:nuevaUnidad.id])
		}
	}
	
	
	
}
