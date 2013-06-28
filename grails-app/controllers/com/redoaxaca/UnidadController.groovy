package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class UnidadController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [unidadInstanceList: Unidad.list(params), unidadInstanceTotal: Unidad.count()]
    }
	

    def create() {
        [unidadInstance: new Unidad(params)]
    }

    def save() {
        def unidadInstance = new Unidad(params)
        if (!unidadInstance.save(flush: true)) {
            render(view: "create", model: [unidadInstance: unidadInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'unidad.label', default: 'Unidad'), unidadInstance.id])
        redirect(action: "show", id: unidadInstance.id)
    }

    def show(Long id) {
        def unidadInstance = Unidad.get(id)
        if (!unidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unidad.label', default: 'Unidad'), id])
            redirect(action: "list")
            return
        }

        [unidadInstance: unidadInstance]
    }

    def edit(Long id) {
        def unidadInstance = Unidad.get(id)
        if (!unidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unidad.label', default: 'Unidad'), id])
            redirect(action: "list")
            return
        }

        [unidadInstance: unidadInstance]
    }

    def update(Long id, Long version) {
        def unidadInstance = Unidad.get(id)
        if (!unidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unidad.label', default: 'Unidad'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (unidadInstance.version > version) {
                unidadInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'unidad.label', default: 'Unidad')] as Object[],
                          "Another user has updated this Unidad while you were editing")
                render(view: "edit", model: [unidadInstance: unidadInstance])
                return
            }
        }

        unidadInstance.properties = params

        if (!unidadInstance.save(flush: true)) {
            render(view: "edit", model: [unidadInstance: unidadInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'unidad.label', default: 'Unidad'), unidadInstance.id])
        redirect(action: "show", id: unidadInstance.id)
    }

    def delete(Long id) {
        def unidadInstance = Unidad.get(id)
        if (!unidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unidad.label', default: 'Unidad'), id])
            redirect(action: "list")
            return
        }

        try {
            unidadInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'unidad.label', default: 'Unidad'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'unidad.label', default: 'Unidad'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def mostrar(Long id) {
		def unidadInstance = Unidad.get(id)
		if (!unidadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'unidad.label', default: 'Unidad'), id])
			redirect(action: "list")
			return
		}

		[unidadInstance: unidadInstance]
	}
	
	def menu(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[unidadInstanceList: Unidad.list(params), unidadInstanceTotal: Unidad.count()]
	}
	
	def insertar3() {
		
	}
	
	def verificarSiExiste() {
		System.out.println("recibo: "+params)
		def unidadProbable = Unidad.findByUnidad(params.unidadTexto.toUpperCase())
		if (unidadProbable) {
			System.out.println("Existe");
			render(template: "verificarExistencia", model: [existe: 1])
			return
		} else {
			System.out.println("NO Existe");
			render(template: "verificarExistencia", model: [existe: 2])
			return
		}
	}
	
	def save_unidad() {
		def unidadInstance = new Unidad(unidad: params.unidad.toUpperCase())
        if (!unidadInstance.save(flush: true)) {
            render(view: "insertar3", model: [unidadInstance: unidadInstance])
            return
        } else {
			flash.message = message(code: 'La unidad se ha agregado correctamente')
			redirect(action: 'menu')
		}
		
	}
	
	def editar2(Long id) {
		def unidadInstance = Unidad.get(id)
		if (!unidadInstance) {
			flash.message = message(code: 'No se ha encontrado la unidad')
			redirect(action: "menu")
			return
		}

		[unidadInstance: unidadInstance]
		
	}
	
	def edit_unidad() {
		def unidadInstance = Unidad.get(Long.parseLong(params.idUnidad))
		unidadInstance.unidad = params.unidad.toUpperCase()
		
		if (!unidadInstance.save(flush: true)) {
			render(view: "editar2", model: [unidadInstance: unidadInstance])
			return
		}

		flash.message = message(code: 'La unidad se ha actualizado correctamente')
		redirect(action: "mostrar", id: unidadInstance.id)
		
	}
}
