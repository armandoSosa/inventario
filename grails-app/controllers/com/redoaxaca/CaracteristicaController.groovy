package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class CaracteristicaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def caracteristicaService
	def scaffold = true
    
	def index = {
		redirect(action: listar)
	}
	
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
			flash.message = "Caracter��stica agregada: ${nuevaCaracteristica.caracteristica}"
		} catch (CaracteristicaException pe) {
			flash.message = pe.message
		}
		redirect(action: 'list')
	}


    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [caracteristicaInstanceList: Caracteristica.list(params), caracteristicaInstanceTotal: Caracteristica.count()]
    }

    def create() {
        [caracteristicaInstance: new Caracteristica(params)]
    }

    def save() {
        def caracteristicaInstance = new Caracteristica(params)
        if (!caracteristicaInstance.save(flush: true)) {
            render(view: "create", model: [caracteristicaInstance: caracteristicaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'caracteristica.label', default: 'Caracteristica'), caracteristicaInstance.id])
        redirect(action: "show", id: caracteristicaInstance.id)
    }

    def show(Long id) {
        def caracteristicaInstance = Caracteristica.get(id)
        if (!caracteristicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'caracteristica.label', default: 'Caracteristica'), id])
            redirect(action: "list")
            return
        }

        [caracteristicaInstance: caracteristicaInstance]
    }

    def edit(Long id) {
        def caracteristicaInstance = Caracteristica.get(id)
        if (!caracteristicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'caracteristica.label', default: 'Caracteristica'), id])
            redirect(action: "list")
            return
        }

        [caracteristicaInstance: caracteristicaInstance]
    }

    def update(Long id, Long version) {
        def caracteristicaInstance = Caracteristica.get(id)
        if (!caracteristicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'caracteristica.label', default: 'Caracteristica'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (caracteristicaInstance.version > version) {
                caracteristicaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'caracteristica.label', default: 'Caracteristica')] as Object[],
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

        flash.message = message(code: 'default.updated.message', args: [message(code: 'caracteristica.label', default: 'Caracteristica'), caracteristicaInstance.id])
        redirect(action: "show", id: caracteristicaInstance.id)
    }

    def delete(Long id) {
        def caracteristicaInstance = Caracteristica.get(id)
        if (!caracteristicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'caracteristica.label', default: 'Caracteristica'), id])
            redirect(action: "list")
            return
        }

        try {
            caracteristicaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'caracteristica.label', default: 'Caracteristica'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'caracteristica.label', default: 'Caracteristica'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def addUnidadAjax = {
		if (params.id.equals("1")) { //canceló
			render (template:'forma', model: [agregarUnidad: params.id, municipio:params.idMunicipio])
		} else {
			render (template:'forma', model: [agregarUnidad: params.id, caracteristica:params.caracteristica1])
		}
	}
}
