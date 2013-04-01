package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class TipoUsuarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def scaffold = true
	
	def index = {
		redirect(action: list)
	}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoUsuarioInstanceList: TipoUsuario.list(params), tipoUsuarioInstanceTotal: TipoUsuario.count()]
    }
	
	def menu(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[tipoUsuarioInstanceList: TipoUsuario.list(params), tipoUsuarioInstanceTotal: TipoUsuario.count()]
	}

    def create() {
        [tipoUsuarioInstance: new TipoUsuario(params)]
    }

    def save() {
        def tipoUsuarioInstance = new TipoUsuario(params)
        if (!tipoUsuarioInstance.save(flush: true)) {
            render(view: "create", model: [tipoUsuarioInstance: tipoUsuarioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoUsuario.label', default: 'TipoUsuario'), tipoUsuarioInstance.id])
        redirect(action: "show", id: tipoUsuarioInstance.id)
    }

    def show(Long id) {
        def tipoUsuarioInstance = TipoUsuario.get(id)
        if (!tipoUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoUsuario.label', default: 'TipoUsuario'), id])
            redirect(action: "list")
            return
        }

        [tipoUsuarioInstance: tipoUsuarioInstance]
    }

    def edit(Long id) {
        def tipoUsuarioInstance = TipoUsuario.get(id)
        if (!tipoUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoUsuario.label', default: 'TipoUsuario'), id])
            redirect(action: "list")
            return
        }

        [tipoUsuarioInstance: tipoUsuarioInstance]
    }

    def update(Long id, Long version) {
        def tipoUsuarioInstance = TipoUsuario.get(id)
        if (!tipoUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoUsuario.label', default: 'TipoUsuario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoUsuarioInstance.version > version) {
                tipoUsuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoUsuario.label', default: 'TipoUsuario')] as Object[],
                          "Another user has updated this TipoUsuario while you were editing")
                render(view: "edit", model: [tipoUsuarioInstance: tipoUsuarioInstance])
                return
            }
        }

        tipoUsuarioInstance.properties = params

        if (!tipoUsuarioInstance.save(flush: true)) {
            render(view: "edit", model: [tipoUsuarioInstance: tipoUsuarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoUsuario.label', default: 'TipoUsuario'), tipoUsuarioInstance.id])
        redirect(action: "show", id: tipoUsuarioInstance.id)
    }

    def delete(Long id) {
        def tipoUsuarioInstance = TipoUsuario.get(id)
        if (!tipoUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoUsuario.label', default: 'TipoUsuario'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoUsuarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoUsuario.label', default: 'TipoUsuario'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoUsuario.label', default: 'TipoUsuario'), id])
            redirect(action: "show", id: id)
        }
    }
}
