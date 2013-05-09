package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class TipoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def tipoService
	def scaffold = true
	
	def insertar = {
		
	}
	
	def insertar2 = {
		[tipoInstance: new Tipo(params)]
	}
	
	def insertarTipo = {
		try {
			def newTipo = tipoService.crearTipo(params.descripcion)
			flash.message = "Tipo: '${params.descripcion}' agregado"
		} catch (TipoException pe) {
			render {
				div(class:"errors", pe.message)
			}
		}
		redirect(action: list)
	}

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoInstanceList: Tipo.list(params), tipoInstanceTotal: Tipo.count()]
    }

    def create() {
        [tipoInstance: new Tipo(params)]
    }

    def save() {
        def tipoInstance = new Tipo(params)
        if (!tipoInstance.save(flush: true)) {
            render(view: "create", model: [tipoInstance: tipoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipo.label', default: 'Tipo'), tipoInstance.id])
        redirect (action: "show", id: tipoInstance.id)
    }
	
	def save_tipo() {
		def tipoInstance = new Tipo(params)
		System.out.println(params);
		//buscamos la clave de inventario
		tipoInstance.noInventarioSeriado=0;
		tipoInstance.claveInventario='';
		
		if (!tipoInstance.save(flush: true)) {
			render(view: "insertar2", model: [tipoInstance: tipoInstance])
			return
		}
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'tipo.label', default: 'Tipo'), tipoInstance.id])
		redirect(controller:"plantilla", action: "insertar2", id: tipoInstance.id)
	}

    def show(Long id) {
        def tipoInstance = Tipo.get(id)
        if (!tipoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipo.label', default: 'Tipo'), id])
            redirect(action: "list")
            return
        }

        [tipoInstance: tipoInstance]
    }

    def edit(Long id) {
        def tipoInstance = Tipo.get(id)
        if (!tipoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipo.label', default: 'Tipo'), id])
            redirect(action: "list")
            return
        }

        [tipoInstance: tipoInstance]
    }

    def update(Long id, Long version) {
        def tipoInstance = Tipo.get(id)
        if (!tipoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipo.label', default: 'Tipo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoInstance.version > version) {
                tipoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipo.label', default: 'Tipo')] as Object[],
                          "Another user has updated this Tipo while you were editing")
                render(view: "edit", model: [tipoInstance: tipoInstance])
                return
            }
        }

        tipoInstance.properties = params

        if (!tipoInstance.save(flush: true)) {
            render(view: "edit", model: [tipoInstance: tipoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipo.label', default: 'Tipo'), tipoInstance.id])
        redirect(action: "show", id: tipoInstance.id)
    }

    def delete(Long id) {
        def tipoInstance = Tipo.get(id)
        if (!tipoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipo.label', default: 'Tipo'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipo.label', default: 'Tipo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipo.label', default: 'Tipo'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def verificarExistencia() {
		System.out.println("uno "+params.tipoTexto)
		def tipoProbable = Tipo.findByDescripcion(params.tipoTexto)
		render(controller:"tipo", template: "formAgregarTipo", model: [tipoProbable: tipoProbable])
	}
}
