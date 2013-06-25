package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class CaracteristicaUnidadController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [caracteristicaUnidadInstanceList: CaracteristicaUnidad.list(params), caracteristicaUnidadInstanceTotal: CaracteristicaUnidad.count()]
    }

    def create() {
        [caracteristicaUnidadInstance: new CaracteristicaUnidad(params)]
    }

    def save() {
        def caracteristicaUnidadInstance = new CaracteristicaUnidad(params)
        if (!caracteristicaUnidadInstance.save(flush: true)) {
            render(view: "create", model: [caracteristicaUnidadInstance: caracteristicaUnidadInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad'), caracteristicaUnidadInstance.id])
        redirect(action: "mostrar", id: caracteristicaUnidadInstance.id)
    }

    def show(Long id) {
        def caracteristicaUnidadInstance = CaracteristicaUnidad.get(id)
        if (!caracteristicaUnidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad'), id])
            redirect(action: "list")
            return
        }

        [caracteristicaUnidadInstance: caracteristicaUnidadInstance]
    }

    def edit(Long id) {
        def caracteristicaUnidadInstance = CaracteristicaUnidad.get(id)
        if (!caracteristicaUnidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad'), id])
            redirect(action: "list")
            return
        }

        [caracteristicaUnidadInstance: caracteristicaUnidadInstance]
    }

    def update(Long id, Long version) {
        def caracteristicaUnidadInstance = CaracteristicaUnidad.get(id)
        if (!caracteristicaUnidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (caracteristicaUnidadInstance.version > version) {
                caracteristicaUnidadInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad')] as Object[],
                          "Another user has updated this CaracteristicaUnidad while you were editing")
                render(view: "edit", model: [caracteristicaUnidadInstance: caracteristicaUnidadInstance])
                return
            }
        }

        caracteristicaUnidadInstance.properties = params

        if (!caracteristicaUnidadInstance.save(flush: true)) {
            render(view: "edit", model: [caracteristicaUnidadInstance: caracteristicaUnidadInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad'), caracteristicaUnidadInstance.id])
        redirect(action: "show", id: caracteristicaUnidadInstance.id)
    }

    def delete(Long id) {
        def caracteristicaUnidadInstance = CaracteristicaUnidad.get(id)
        if (!caracteristicaUnidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad'), id])
            redirect(action: "list")
            return
        }

        try {
            caracteristicaUnidadInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def mostrar(Long id) {
		def caracteristicaUnidadInstance = CaracteristicaUnidad.get(id)
		if (!caracteristicaUnidadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'caracteristicaUnidad.label', default: 'CaracteristicaUnidad'), id])
			redirect(action: "menu")
			return
		}

		[caracteristicaUnidadInstance: caracteristicaUnidadInstance]
	}
	
	def menu(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[caracteristicaUnidadInstanceList: CaracteristicaUnidad.list(params), caracteristicaUnidadInstanceTotal: CaracteristicaUnidad.count()]
	}
	
	def insertar() {
		[caracteristicaUnidadInstance: new CaracteristicaUnidad(params)]
	}
	
}
