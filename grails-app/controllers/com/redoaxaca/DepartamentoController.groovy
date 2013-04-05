package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class DepartamentoController {
	def scaffold = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

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
        [departamentoInstanceList: Departamento.list(params), departamentoInstanceTotal: Departamento.count()]
    }
	
	def menu(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[departamentoInstanceList: Departamento.list(params), departamentoInstanceTotal: Departamento.count()]
	}
	
    def create() {
        [departamentoInstance: new Departamento(params)]
    }

    def save() {
        def departamentoInstance = new Departamento(params)
        if (!departamentoInstance.save(flush: true)) {
            render(view: "create", model: [departamentoInstance: departamentoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamentoInstance.id])
        redirect(action: "show", id: departamentoInstance.id)
    }
	
	def save_departamento() {
		def departamentoInstance = new Departamento(params)
		if (!departamentoInstance.save(flush: true)) {
			render(view: "insertar", model: [departamentoInstance: departamentoInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamentoInstance.id])
		redirect(action: "menu")
	}
	
	def save_departamento_puesto(){
		def departamentoInstance = new Departamento(params)
		if (!departamentoInstance.save(flush: true)) {
			flash.message = "No se puede crear el departamento"
			render(view: "insertar", controller: "puesto", model: [departamentoInstance: departamentoInstance])
			return
		}		
		redirect(action: "insertar", controller: "puesto", model: [departamentoInstance: departamentoInstance])

	}

    def show(Long id) {
        def departamentoInstance = Departamento.get(id)
        if (!departamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
            return
        }

        [departamentoInstance: departamentoInstance]
    }

    def edit(Long id) {
        def departamentoInstance = Departamento.get(id)
        if (!departamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
            return
        }

        [departamentoInstance: departamentoInstance]
    }

    def update(Long id, Long version) {
        def departamentoInstance = Departamento.get(id)
        if (!departamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (departamentoInstance.version > version) {
                departamentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'departamento.label', default: 'Departamento')] as Object[],
                          "Another user has updated this Departamento while you were editing")
                render(view: "edit", model: [departamentoInstance: departamentoInstance])
                return
            }
        }

        departamentoInstance.properties = params

        if (!departamentoInstance.save(flush: true)) {
            render(view: "edit", model: [departamentoInstance: departamentoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamentoInstance.id])
        redirect(action: "show", id: departamentoInstance.id)
    }

    def delete(Long id) {
        def departamentoInstance = Departamento.get(id)
        if (!departamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
            return
        }

        try {
            departamentoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "show", id: id)
        }
    }
}
