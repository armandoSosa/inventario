package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class PlantillaController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[plantillaInstanceList: Plantilla.list(params), plantillaInstanceTotal: Plantilla.count()]
	}

	def create() {
		[plantillaInstance: new Plantilla(params)]
	}

	def save() {
		def plantillaInstance = new Plantilla(params)
		if (!plantillaInstance.save(flush: true)) {
			render(view: "create", model: [plantillaInstance: plantillaInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'plantilla.label', default: 'Plantilla'),
			plantillaInstance.id
		])
		redirect(action: "show", id: plantillaInstance.id)
	}

	def show(Long id) {
		def plantillaInstance = Plantilla.get(id)
		if (!plantillaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'plantilla.label', default: 'Plantilla'),
				id
			])
			redirect(action: "list")
			return
		}

		[plantillaInstance: plantillaInstance]
	}

	def edit(Long id) {
		def plantillaInstance = Plantilla.get(id)
		if (!plantillaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'plantilla.label', default: 'Plantilla'),
				id
			])
			redirect(action: "list")
			return
		}

		[plantillaInstance: plantillaInstance]
	}

	def update(Long id, Long version) {
		def plantillaInstance = Plantilla.get(id)
		if (!plantillaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'plantilla.label', default: 'Plantilla'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (plantillaInstance.version > version) {
				plantillaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'plantilla.label', default: 'Plantilla')] as Object[],
						"Another user has updated this Plantilla while you were editing")
				render(view: "edit", model: [plantillaInstance: plantillaInstance])
				return
			}
		}

		plantillaInstance.properties = params

		if (!plantillaInstance.save(flush: true)) {
			render(view: "edit", model: [plantillaInstance: plantillaInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'plantilla.label', default: 'Plantilla'),
			plantillaInstance.id
		])
		redirect(action: "show", id: plantillaInstance.id)
	}

	def delete(Long id) {
		def plantillaInstance = Plantilla.get(id)
		if (!plantillaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'plantilla.label', default: 'Plantilla'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			plantillaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'plantilla.label', default: 'Plantilla'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'plantilla.label', default: 'Plantilla'),
				id
			])
			redirect(action: "show", id: id)
		}
	}

	def insertar2(Long id) {
		//Buscamos las características que están asignadas al tipo de objeto
		System.out.println("Recibo "+params+" id "+id)
		def tipo = Tipo.get(id)
		if (tipo!=null) {
			def plantillas = tipo.plantilla
			def caracteristicasActuales = new ArrayList()
			for (Plantilla p in plantillas) {
				caracteristicasActuales.add(p.caracteristicaUnidad)
			}

			//buscamos las plantillas que no están asignadas al tipo
			def criterio2 = CaracteristicaUnidad.createCriteria();
			def plantillasNoAgregadas = criterio2.listDistinct {
				not {'in'("id", plantillas.caracteristicaUnidad.id)}
			}

			[caracteristicasActuales:caracteristicasActuales, caracteristicas: plantillasNoAgregadas, idTipo: id]
		} else {
			redirect(action: "list")
		}
	}

	def save_plantilla() {
		System.out.println(params)

		def caracUnidadString = params.list('caracteristicas')

		def caracteristicaUnidad
		def tipo = Tipo.get(Long.parseLong(params.idTipo))
		def nuevaPlantilla
		for (String s in caracUnidadString) {
			caracteristicaUnidad = CaracteristicaUnidad.get(Long.parseLong(s))
			nuevaPlantilla = new Plantilla(tipo:tipo, caracteristicaUnidad:caracteristicaUnidad)
			tipo.addToPlantilla(nuevaPlantilla)
		}

		if (!tipo.save(flush: true)) {
			flash.message = message(code: 'Hubo un error al agregar las características')
			render(view: "insertar2", model: [tipoInstance: tipoInstance])
			
			return
		} else {
			flash.message = message(code: 'Las características se han agregado correctamente')
			redirect(controller:"tipo", action: "mostrar", id: tipo.id)
		}
		 
	}
}
