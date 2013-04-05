package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class ValorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def scaffold = true

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [valorInstanceList: Valor.list(params), valorInstanceTotal: Valor.count()]
    }

    def create() {
        [valorInstance: new Valor(params)]
    }

    def save() {
        def valorInstance = new Valor(params)
        if (!valorInstance.save(flush: true)) {
            render(view: "create", model: [valorInstance: valorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'valor.label', default: 'Valor'), valorInstance.id])
        redirect(action: "show", id: valorInstance.id)
    }

    def show(Long id) {
        def valorInstance = Valor.get(id)
        if (!valorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'valor.label', default: 'Valor'), id])
            redirect(action: "list")
            return
        }

        [valorInstance: valorInstance]
    }

    def edit(Long id) {
        def valorInstance = Valor.get(id)
        if (!valorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'valor.label', default: 'Valor'), id])
            redirect(action: "list")
            return
        }

        [valorInstance: valorInstance]
    }

    def update(Long id, Long version) {
        def valorInstance = Valor.get(id)
        if (!valorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'valor.label', default: 'Valor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (valorInstance.version > version) {
                valorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'valor.label', default: 'Valor')] as Object[],
                          "Another user has updated this Valor while you were editing")
                render(view: "edit", model: [valorInstance: valorInstance])
                return
            }
        }

        valorInstance.properties = params

        if (!valorInstance.save(flush: true)) {
            render(view: "edit", model: [valorInstance: valorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'valor.label', default: 'Valor'), valorInstance.id])
        redirect(action: "show", id: valorInstance.id)
    }

    def delete(Long id) {
        def valorInstance = Valor.get(id)
        if (!valorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'valor.label', default: 'Valor'), id])
            redirect(action: "list")
            return
        }

        try {
            valorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'valor.label', default: 'Valor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'valor.label', default: 'Valor'), id])
            redirect(action: "show", id: id)
        }
    }
}
