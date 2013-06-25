package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class CaracteristicaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
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
	
	def insertar3() {
		
	}
	
	def verificarSiExiste() {
		def caracProbable = Caracteristica.findByCaracteristica(params.caracteristicaTexto.toUpperCase())
		if (caracProbable) {
			System.out.println("Existe");
			render(controller: "caracteristica", template: "verificarExistencia", model: [existe: 1])
			return
		} else {
			System.out.println("NO Existe");
			render(controller: "caracteristica", template: "verificarExistencia", model: [existe: 2])
			return
		}
	}
	
	def save_caracteristica() {
		def caracteristicaInstance = new Caracteristica (caracteristica: params.caracteristica.toUpperCase()) 
		if (!caracteristicaInstance.save(flush: true)) {
			render(view: "create", model: [caracteristicaInstance: caracteristicaInstance])
			return
		} else {
			flash.message = message(code: 'La característica se ha agregado correctamente')
			redirect(action: 'menu')
		}
		
	}
	
	def mostrar(Long id) {
		def caracteristicaInstance = Caracteristica.get(id)
		if (!caracteristicaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'caracteristica.label', default: 'Caracteristica'), id])
			redirect(action: "list")
			return
		}

		[caracteristicaInstance: caracteristicaInstance]
	}
}
