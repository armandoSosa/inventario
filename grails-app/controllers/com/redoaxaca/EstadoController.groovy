package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class EstadoController {
	def scaffold = true

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [estadoInstanceList: Estado.list(params), estadoInstanceTotal: Estado.count()]
    }
	def menu(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[estadoInstanceList: Estado.list(params), estadoInstanceTotal: Estado.count()]
	}

	def listar = {
			}
	
	def modificar = {
		
	}
	
	def eliminar = {
		
	}
	
	def insertar = {
		
	}

    def create() {
        [estadoInstance: new Estado(params)]
    }

    def save() {
        def estadoInstance = new Estado(params)
        if (!estadoInstance.save(flush: true)) {
            render(view: "create", model: [estadoInstance: estadoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'estado.label', default: 'Estado'), estadoInstance.id])
        redirect(action: "show", id: estadoInstance.id)
    }
	
	def save_estado() {
		def estadoInstance = new Estado(params)
		if (!estadoInstance.save(flush: true)) {
			render(view: "insertar", model: [estadoInstance: estadoInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'estado.label', default: 'Estado'), estadoInstance.id])
		redirect(action: "menu")
	}

    def show(Long id) {
        def estadoInstance = Estado.get(id)
        if (!estadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), id])
            redirect(action: "list")
            return
        }

        [estadoInstance: estadoInstance]
    }

    def edit(Long id) {
        def estadoInstance = Estado.get(id)
        if (!estadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), id])
            redirect(action: "list")
            return
        }

        [estadoInstance: estadoInstance]
    }

    def update(Long id, Long version) {
        def estadoInstance = Estado.get(id)
        if (!estadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (estadoInstance.version > version) {
                estadoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'estado.label', default: 'Estado')] as Object[],
                          "Another user has updated this Estado while you were editing")
                render(view: "edit", model: [estadoInstance: estadoInstance])
                return
            }
        }

        estadoInstance.properties = params

        if (!estadoInstance.save(flush: true)) {
            render(view: "edit", model: [estadoInstance: estadoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'estado.label', default: 'Estado'), estadoInstance.id])
        redirect(action: "show", id: estadoInstance.id)
    }

    def delete(Long id) {
        def estadoInstance = Estado.get(id)
        if (!estadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), id])
            redirect(action: "list")
            return
        }

        try {
            estadoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'estado.label', default: 'Estado'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'estado.label', default: 'Estado'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def buscarEstado = {
		def tipos
		if (!params.estado.equals("")){
			def criterio = Estado.createCriteria()
			tipos = criterio.listDistinct {
					ilike ('nombre', "%"+params.estado+"%")
					
			}
		}
		
		render (template:'tablaEstados', model: [ tipos: tipos])
		
	}
	
	def mostrarMunicipios(Long id){
		def estadoInstance = Estado.get(id)
		
		def idEstado = estadoInstance?.id
		session["estado"] = estadoInstance?.id
		//Se obtiene la lista de municipio
		def municipiosList = estadoInstance?.municipios		
		
		//Se hace el render del template '_selectMunicipios.gsp' con la lista de estados obtenida.
		render(template: "municipios", model: [municipiosList:municipiosList, estadoInstance: estadoInstance])
	}
}
