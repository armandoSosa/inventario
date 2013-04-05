package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class PersonaController {
	

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def scaffold = true
	
	def index = {
		redirect(action: list)
	}
	
	def tipoPersona = {
		
	}
	def listar = {
	}
	
	def modificar = {
		
	}
	
	def eliminar = {
		
	}
	
	def insertar(Long id) {
		session["estado"] = 0
		session["persona"] = true
		[idEstado : id, personaInstance: new Persona(params), municipioInstance: new Municipio(params), estadoInstance: new Estado(params) ]
	}
	
	def empleados(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[personaInstanceList: Persona.list(params), personaInstanceTotal: Persona.count()]
		
	}

    def index() {
        redirect(action: "list", params: params)
    }
	def configuracion = {
		
	}
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [personaInstanceList: Persona.list(params), personaInstanceTotal: Persona.count()]
    }

    def create() {
        [personaInstance: new Persona(params)]
    }

    def save_persona() {
        def personaInstance = new Persona(params)
		def direccionInstance = new Direccion(params)
		def telefonoInstance = new Telefono(params)
		telefonoInstance.fecha = new Date()		
		telefonoInstance.persona = personaInstance
		direccionInstance.fecha = new Date()
		direccionInstance.persona = personaInstance
		 		
        if (!personaInstance.save(flush: true)) {
            render(view: "insertar", model: [personaInstance: personaInstance, direccionInstance: direccionInstance ])
            return
        }
		
		if(!direccionInstance.save(flush: true)){
			render(view: "insertar", model: [personaInstance: personaInstance, direccionInstance: direccionInstance])
			return 
		}
		
		if (!telefonoInstance.save(flush: true)) {
			render(view: "insertar", model: [personaInstance: personaInstance, direccionInstance: direccionInstance ])
			return
		}

        flash.message = message(code: 'default.created.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
        redirect(action: "empleados")
    }
	
	def save_estado() {		
		def estadoInstance = new Estado(params)		
		if (!estadoInstance.save(flush: true)) {
			flash.message = "No se puede agregar el Estado"
			render(view: "insertar")
			return
		}
		//render(view: "insertar", model: [idEstado:estadoInstance.id, idMunicipio: -1])
		redirect(action:'insertar', params: [idEstado: estadoInstance.id, idMunicipio: -1])
		//redirect(action: "insertar", id: estadoInstance.id)
	}
	
	def getMunicipios = {
		//Se obtiene el estado
		def estadoInstance = Estado.get(params.id)
		def personaInstance = new Persona(params)
		def idEstado = estadoInstance?.id		
		session["estado"] = estadoInstance?.id 		
		//Se obtiene la lista de municipio
		def municipiosList = estadoInstance?.municipios
		//Se hace el render del template '_selectMunicipios.gsp' con la lista de estados obtenida.
		render(template: "selectMunicipios", model: [personaInstance: personaInstance, municipiosList:municipiosList, idEstado: 2])
	}
	
	def guardarInstancia = {
		def personaInstance = new Persona(params)
		[personaInstance: personaInstance]
	}

    def show(Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "list")
            return
        }

        [personaInstance: personaInstance]
    }
	
	def mostrar(Long id) {
		def personaInstance = Persona.get(id)
		if (!personaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
			redirect(action: "menu")
			return
		}

		[personaInstance: personaInstance]
	}

    def edit(Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "list")
            return
        }

        [personaInstance: personaInstance]
    }

    def update(Long id, Long version) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (personaInstance.version > version) {
                personaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'persona.label', default: 'Persona')] as Object[],
                          "Another user has updated this Persona while you were editing")
                render(view: "edit", model: [personaInstance: personaInstance])
                return
            }
        }

        personaInstance.properties = params

        if (!personaInstance.save(flush: true)) {
            render(view: "edit", model: [personaInstance: personaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
        redirect(action: "show", id: personaInstance.id)
    }

    def delete(Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "list")
            return
        }

        try {
            personaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "show", id: id)
        }
    }
}
