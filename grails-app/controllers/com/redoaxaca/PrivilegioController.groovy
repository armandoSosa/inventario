package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class PrivilegioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def scaffold = true
	

    def index() {
        redirect(action: "list", params: params)
    }
	
	def listar = {
	}

	def modificar = {
	
	}
	
	def eliminar = {
	
	}
	
	def insertar = {
	
	}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [privilegioInstanceList: Privilegio.list(params), privilegioInstanceTotal: Privilegio.count()]
    }
	
	def menu(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[privilegioInstanceList: Privilegio.list(params), privilegioInstanceTotal: Privilegio.count()]
	}

    def create() {
        [privilegioInstance: new Privilegio(params)]
    }

    def save() {
        def privilegioInstance = new Privilegio(params)
        if (!privilegioInstance.save(flush: true)) {
            render(view: "create", model: [privilegioInstance: privilegioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'privilegio.label', default: 'Privilegio'), privilegioInstance.id])
        redirect(action: "show", id: privilegioInstance.id)
    }
	
	def save_privilegio() {
		def privilegioInstance = new Privilegio(params)
		if (!privilegioInstance.save(flush: true)) {
			render(view: "insertar", model: [privilegioInstance: privilegioInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'privilegio.label', default: 'Privilegio'), privilegioInstance.id])
		redirect(action: "menu")
	}
	
	def save_privilegio_tipoUsuario(){
		def privilegioInstance = new Privilegio(params)
		if (!privilegioInstance.save(flush: true)) {
			render(view: "insertar", controller: "privilegioTipoUsuario", model: [privilegioInstance: privilegioInstance])
			return
		}
		redirect(action: "insertar", controller: "privilegioTipoUsuario", id: privilegioInstance.id)
	}

    def show(Long id) {
        def privilegioInstance = Privilegio.get(id)
        if (!privilegioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'privilegio.label', default: 'Privilegio'), id])
            redirect(action: "list")
            return
        }

        [privilegioInstance: privilegioInstance]
    }

    def edit(Long id) {
        def privilegioInstance = Privilegio.get(id)
        if (!privilegioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'privilegio.label', default: 'Privilegio'), id])
            redirect(action: "list")
            return
        }

        [privilegioInstance: privilegioInstance]
    }

    def update(Long id, Long version) {
        def privilegioInstance = Privilegio.get(id)
        if (!privilegioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'privilegio.label', default: 'Privilegio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (privilegioInstance.version > version) {
                privilegioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'privilegio.label', default: 'Privilegio')] as Object[],
                          "Another user has updated this Privilegio while you were editing")
                render(view: "edit", model: [privilegioInstance: privilegioInstance])
                return
            }
        }

        privilegioInstance.properties = params

        if (!privilegioInstance.save(flush: true)) {
            render(view: "edit", model: [privilegioInstance: privilegioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'privilegio.label', default: 'Privilegio'), privilegioInstance.id])
        redirect(action: "show", id: privilegioInstance.id)
    }

    def delete(Long id) {
        def privilegioInstance = Privilegio.get(id)
        if (!privilegioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'privilegio.label', default: 'Privilegio'), id])
            redirect(action: "list")
            return
        }

        try {
            privilegioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'privilegio.label', default: 'Privilegio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'privilegio.label', default: 'Privilegio'), id])
            redirect(action: "show", id: id)
        }
    }
}
