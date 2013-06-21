package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class FotoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def scaffold = true
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [fotoInstanceList: Foto.list(params), fotoInstanceTotal: Foto.count()]
    }

    def create() {
        [fotoInstance: new Foto(params)]
    }

    def save() {
        def fotoInstance = new Foto(params)
        if (!fotoInstance.save(flush: true)) {
            render(view: "create", model: [fotoInstance: fotoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'foto.label', default: 'Foto'), fotoInstance.id])
        redirect(action: "show", id: fotoInstance.id)
    }
	
	def save_foto() {
		def fotoInstance = new Foto(params)
		if (!fotoInstance.save(flush: true)) {
			render(view: "create", model: [fotoInstance: fotoInstance])
			return
		}
		redirect(action: "insertar2", controller: "persona", id: fotoInstance.id)		
	}
	
	def modificar_foto() {		
		def fotoInstance = Foto.get(params.idfoto)
		System.out.println("idfoto:"+params.idfoto)
		if (!fotoInstance.save(flush: true)) {
			render(view: "create", model: [fotoInstance: fotoInstance])
			return
		}
		redirect(action: "insertar2", controller: "persona", id: fotoInstance.id)
	}
	

    def show(Long id) {
        def fotoInstance = Foto.get(id)
        if (!fotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foto.label', default: 'Foto'), id])
            redirect(action: "list")
            return
        }

        [fotoInstance: fotoInstance]
    }

    def edit(Long id) {
        def fotoInstance = Foto.get(id)
        if (!fotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foto.label', default: 'Foto'), id])
            redirect(action: "list")
            return
        }

        [fotoInstance: fotoInstance]
    }

    def update(Long id, Long version) {
        def fotoInstance = Foto.get(id)
        if (!fotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foto.label', default: 'Foto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (fotoInstance.version > version) {
                fotoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'foto.label', default: 'Foto')] as Object[],
                          "Another user has updated this Foto while you were editing")
                render(view: "edit", model: [fotoInstance: fotoInstance])
                return
            }
        }

        fotoInstance.properties = params

        if (!fotoInstance.save(flush: true)) {
            render(view: "edit", model: [fotoInstance: fotoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'foto.label', default: 'Foto'), fotoInstance.id])
        redirect(action: "show", id: fotoInstance.id)
    }

    def delete(Long id) {
        def fotoInstance = Foto.get(id)
        if (!fotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foto.label', default: 'Foto'), id])
            redirect(action: "list")
            return
        }

        try {
            fotoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'foto.label', default: 'Foto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'foto.label', default: 'Foto'), id])
            redirect(action: "show", id: id)
        }
    }
}
