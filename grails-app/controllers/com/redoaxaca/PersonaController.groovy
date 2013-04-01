package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class PersonaController {
	
	def scaffold = Persona
	
	def tipoPersona = {
		
	}
	def listar = {
			}
	
	def modificar = {
		
	}
	
	def eliminar = {
		
	}
	
	def insertar = {
		
	}

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [personaInstanceList: Persona.list(params), personaInstanceTotal: Persona.count()]
    }

    def create() {
        [personaInstance: new Persona(params)]
    }
	
	def crear(){
		[personaInstance: new Persona(params)]
	}
	
	def upload_avatar = {
		def user = Persona.findByNumeroEmpleado(1)
		// Get the avatar file from the multi-part request
		def f = request.getFile('avatar')
	  
		// List of OK mime-types
		def okcontents = ['image/png', 'image/jpeg', 'image/gif']
		if (! okcontents.contains(f.getContentType())) {
		  flash.message = "Avatar must be one of: ${okcontents}"
		   redirect(action: "show", id: user.id)
		  return;
		}
	  
		// Save the image and mime type
		user.foto = f.getBytes()		
	  
		// Validation works, will check if the image is too big
		if (!user.save()) {
		  redirect(action: "show", id: user.id)
		  return;
		}
		flash.message = "Avatar (${user.foto.size()} bytes) uploaded."
		redirect(action: "show", id: user.id)
	  }
	
	def avatar_image = {
		def avatarUser = Persona.get(params.id)
		if (!avatarUser || !avatarUser.foto) {
		  response.sendError(404)
		  return;
		}
		response.setContentLength(avatarUser.foto.size())
		OutputStream out = response.getOutputStream();
		out.write(avatarUser.foto);
		out.close();
	  }

    def save() {
        def personaInstance = new Persona(params)
		def foto = request.getFile('foto')
		def okcontents = ['image/png', 'image/jpeg', 'image/gif']
		if(!foto){
						 			  		
		}
		if (! okcontents.contains(foto.getContentType())) {
			flash.message = "Avatar must be one of: ${okcontents}"
		}
		// Save the image
		personaInstance.foto = foto.getBytes()
		
        if (!personaInstance.save(flush: true)) {
            render(view: "create", model: [personaInstance: personaInstance])
            return
        }

        //flash.message = message(code: 'default.created.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
        redirect(action: "show", id: personaInstance.id)
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
