package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class TipoTelefonoController {
	def scaffold = true

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoTelefonoInstanceList: TipoTelefono.list(params), tipoTelefonoInstanceTotal: TipoTelefono.count()]
    }
	
	def menu(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[tipoTelefonoInstanceList: TipoTelefono.list(params), tipoTelefonoInstanceTotal: TipoTelefono.count()]
	}

    def create() {
        [tipoTelefonoInstance: new TipoTelefono(params)]
    }

    def save() {
        def tipoTelefonoInstance = new TipoTelefono(params)
        if (!tipoTelefonoInstance.save(flush: true)) {
            render(view: "create", model: [tipoTelefonoInstance: tipoTelefonoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoTelefono.label', default: 'TipoTelefono'), tipoTelefonoInstance.id])
        redirect(action: "show", id: tipoTelefonoInstance.id)
    }

    def show(Long id) {
        def tipoTelefonoInstance = TipoTelefono.get(id)
        if (!tipoTelefonoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoTelefono.label', default: 'TipoTelefono'), id])
            redirect(action: "list")
            return
        }

        [tipoTelefonoInstance: tipoTelefonoInstance]
    }

    def edit(Long id) {
        def tipoTelefonoInstance = TipoTelefono.get(id)
        if (!tipoTelefonoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoTelefono.label', default: 'TipoTelefono'), id])
            redirect(action: "list")
            return
        }

        [tipoTelefonoInstance: tipoTelefonoInstance]
    }

    def update(Long id, Long version) {
        def tipoTelefonoInstance = TipoTelefono.get(id)
        if (!tipoTelefonoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoTelefono.label', default: 'TipoTelefono'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoTelefonoInstance.version > version) {
                tipoTelefonoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoTelefono.label', default: 'TipoTelefono')] as Object[],
                          "Another user has updated this TipoTelefono while you were editing")
                render(view: "edit", model: [tipoTelefonoInstance: tipoTelefonoInstance])
                return
            }
        }

        tipoTelefonoInstance.properties = params

        if (!tipoTelefonoInstance.save(flush: true)) {
            render(view: "edit", model: [tipoTelefonoInstance: tipoTelefonoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoTelefono.label', default: 'TipoTelefono'), tipoTelefonoInstance.id])
        redirect(action: "show", id: tipoTelefonoInstance.id)
    }

    def delete(Long id) {
        def tipoTelefonoInstance = TipoTelefono.get(id)
        if (!tipoTelefonoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoTelefono.label', default: 'TipoTelefono'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoTelefonoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoTelefono.label', default: 'TipoTelefono'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoTelefono.label', default: 'TipoTelefono'), id])
            redirect(action: "show", id: id)
        }
    }
}
