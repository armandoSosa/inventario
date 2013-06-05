package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class ObjetoPersonaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [objetoPersonaInstanceList: ObjetoPersona.list(params), objetoPersonaInstanceTotal: ObjetoPersona.count()]
    }

    def create() {
        [objetoPersonaInstance: new ObjetoPersona(params)]
    }

    def save() {
        def objetoPersonaInstance = new ObjetoPersona(params)
        if (!objetoPersonaInstance.save(flush: true)) {
            render(view: "create", model: [objetoPersonaInstance: objetoPersonaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'objetoPersona.label', default: 'ObjetoPersona'), objetoPersonaInstance.id])
        redirect(action: "show", id: objetoPersonaInstance.id)
    }

    def show(Long id) {
        def objetoPersonaInstance = ObjetoPersona.get(id)
        if (!objetoPersonaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetoPersona.label', default: 'ObjetoPersona'), id])
            redirect(action: "list")
            return
        }

        [objetoPersonaInstance: objetoPersonaInstance]
    }
	
	def mostrar(Long id) {
		def objetoPersonaInstance = ObjetoPersona.get(id)
		if (!objetoPersonaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetoPersona.label', default: 'ObjetoPersona'), id])
			redirect(action: "list")
			return
		}

		[objetoPersonaInstance: objetoPersonaInstance]
	}

    def edit(Long id) {
        def objetoPersonaInstance = ObjetoPersona.get(id)
        if (!objetoPersonaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetoPersona.label', default: 'ObjetoPersona'), id])
            redirect(action: "list")
            return
        }

        [objetoPersonaInstance: objetoPersonaInstance]
    }

    def update(Long id, Long version) {
        def objetoPersonaInstance = ObjetoPersona.get(id)
        if (!objetoPersonaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetoPersona.label', default: 'ObjetoPersona'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (objetoPersonaInstance.version > version) {
                objetoPersonaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'objetoPersona.label', default: 'ObjetoPersona')] as Object[],
                          "Another user has updated this ObjetoPersona while you were editing")
                render(view: "edit", model: [objetoPersonaInstance: objetoPersonaInstance])
                return
            }
        }

        objetoPersonaInstance.properties = params

        if (!objetoPersonaInstance.save(flush: true)) {
            render(view: "edit", model: [objetoPersonaInstance: objetoPersonaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'objetoPersona.label', default: 'ObjetoPersona'), objetoPersonaInstance.id])
        redirect(action: "show", id: objetoPersonaInstance.id)
    }

    def delete(Long id) {
        def objetoPersonaInstance = ObjetoPersona.get(id)
        if (!objetoPersonaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetoPersona.label', default: 'ObjetoPersona'), id])
            redirect(action: "list")
            return
        }

        try {
            objetoPersonaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'objetoPersona.label', default: 'ObjetoPersona'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'objetoPersona.label', default: 'ObjetoPersona'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def scaffold = true
	def postService
	def index = {
		redirect(action: list)
	}
	
	def listar = {
	}

	def modificar = {
	
	}
	
	def eliminar = {
	
	}
	
	def insertar = {
		[objetoPersonaInstance: new ObjetoPersona(params), personaInstance: new Persona(params)]
	}
	
	def getObjetos(){
		//Se obtiene el estado
			def personaInstance = Persona.get(params.id)
		
		
		
		def objetosList = Objeto.list()
		//Se hace el render del template '_selectMunicipios.gsp' con la lista de estados obtenida.
		render(template: "selectObjetos", model: [personaInstance: personaInstance, objetosList: objetosList])
	}
	
	
	def listadoPorPersona = {
		//def objetos = objetos.findByDescripcion(params.id)
		//def variable=params.id

		
		def criterio = ObjetoPersona.createCriteria()
		def objetosPersona = criterio.list {
			persona {
				eq 'numeroEmpleado', params.id
			}
		}
		//Buscamos la informaci��n de la persona
		criterio = Persona.createCriteria()
		def persona = criterio.list {
			eq 'numeroEmpleado', params.id
		}
		
		return [ objetosPersona: objetosPersona, persona: persona]
	}
	
	def save_objetoPersona(){
		def personaInstance = Persona.findById(params.persona.id)
		
		personaInstance.properties = params
		
		// find the phones that are marked for deletion
		def _toBeDeleted = personaInstance.objetosPersona.findAll {(it?.deleted || (it == null))}
		 
		// if there are phones to be deleted remove them all
		if (_toBeDeleted) {
			personaInstance.objetosPersona.removeAll(_toBeDeleted)
		}
		
		personaInstance.objetosPersona.eachWithIndex(){objeto, i ->
			objeto.fechaInicio = new Date()
			objeto.index = i
		}
			   
		 if (!personaInstance.hasErrors() && !personaInstance.save(flush: true)) {
			 render(view: "insertar", model: [personaInstance: personaInstance])
			 return
		 }
		 
		redirect(action: "list")
	}
	
	def save_objeto_persona(){
		def objetoPersonaInstance = new ObjetoPersona(params)
		objetoPersonaInstance.fechaInicio = new Date()
		if (!objetoPersonaInstance.save(flush: true)) {
			flash.message = "No se puede asignar el objeto a la persona"
			render(view: "insertar", model: [objetoPersonaInstance: objetoPersonaInstance])
			return
		}
		redirect(action: "show", id: objetoPersonaInstance.id)
	}
}



