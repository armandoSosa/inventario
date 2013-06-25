package com.redoaxaca

import java.awt.print.Printable;

import org.springframework.dao.DataIntegrityViolationException

class PersonaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def scaffold = true
	
	def inicio (Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[personaInstanceList: Persona.list(params), personaInstanceTotal: Persona.count()]
	}
	
	def index2 = {
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
	
	def insertar2(Long id){
		session["estado"] = 0
		session["persona"] = true
		[idEstado : id, personaInstance: new Persona(params), municipioInstance: new Municipio(params), estadoInstance: new Estado(params), telefonoInstance: new Telefono(params), fotoInstance: new Foto(params) ]
	}
	
	def renderImage = {
		def user = Foto.findById(params.id)	    
		if (user?.foto) {
		response.setContentLength(user.foto.length)
		response.outputStream.write(user.foto)
		} else {
		response.sendError(404)
		}
	}
	
	def insertar(Long id) {
		session["estado"] = 0
		session["persona"] = true
		[idEstado : id, personaInstance: new Persona(params), municipioInstance: new Municipio(params), estadoInstance: new Estado(params), telefonoInstance: new Telefono(params), puestoInstance: new PuestoPersona(params) ]
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
		def puestoPersonaInstance = new PuestoPersona(params)
		def fotoInstance = Foto.findById(params.idfoto)
		System.out.println("idfoto:"+params.idfoto)
		personaInstance.properties = params
		
		personaInstance.setNombre(personaInstance.getNombre().toUpperCase())
		personaInstance.setMaterno(personaInstance.getMaterno().toUpperCase())
		personaInstance.setPaterno(personaInstance.getPaterno().toUpperCase())
		direccionInstance.setCalle(direccionInstance.getCalle().toUpperCase())
		direccionInstance.setColonia(direccionInstance.getColonia().toUpperCase())		
		
		direccionInstance.fecha = new Date()		
		puestoPersonaInstance.persona = personaInstance
		puestoPersonaInstance.fechaInicio = new Date()
		
		 
				
		String rfc = params.rfc
		String anio = rfc.substring(4, 6)
		String mes = rfc.substring(6, 8)
		String dia = rfc.substring(8, 10)
		Date fecha = new Date(Integer.parseInt(anio), Integer.parseInt(mes)-1, Integer.parseInt(dia))
		
		personaInstance.fechaNacimiento = fecha
		
		personaInstance.curp = personaInstance.curp.toString().toUpperCase()
		personaInstance.rfc = personaInstance.rfc.toString().toUpperCase()
		/*
	   // find the phones that are marked for deletion
	   def _toBeDeleted = personaInstance.telefonos.findAll {(it?.deleted || (it == null))}
		
	   // if there are phones to be deleted remove them all
	   if (_toBeDeleted) {
		   personaInstance.telefonos.removeAll(_toBeDeleted)
	   }
	   
	   personaInstance.telefonos.eachWithIndex(){tel, i ->
		   tel.fecha = new Date()		   
		   tel.index = i		   
	   }*/		
	   
		personaInstance.addToDirecciones(direccionInstance)
		personaInstance.addToPuestosPersona(puestoPersonaInstance)			         			
		personaInstance.setFoto(fotoInstance)
		
		int cantidad = 0
		if(params.cantidad!='')
			cantidad = params.cantidad
	   
	   for(int i=1; i<=cantidad; i++ ){
		   if((params.get("num"+i))!=null){			   
			   Telefono tel = new Telefono()
			   tel.setFecha(new Date())
			   tel.setTelefono(params.get("num"+i))			   
			   tel.tipoTelefono = TipoTelefono.findByTipo(params.get("tipo"+i).toString().trim())
			   personaInstance.addToTelefonos(tel)
		   }
	   }
	   if (!personaInstance.save(flush: true)) {
		   flash.error = "No se pudo insertar"
		   render(view: "insertar2", model: [personaInstance: personaInstance, direccionInstance: direccionInstance, puestoPersonaInstance: puestoPersonaInstance ])
		   return
	   }

        flash.message = message(code: 'default.created.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
        redirect(action: "empleados")
    }
	
	def save_estado() {		
		def estadoInstance = new Estado(params)		
		if (!estadoInstance.save(flush: true)) {
			flash.message = "No se puede agregar el Estado"
			render(view: "insertar2")
			return
		}
		//render(view: "insertar", model: [idEstado:estadoInstance.id, idMunicipio: -1])
		redirect(action:'insertar2', params: [idEstado: estadoInstance.id, idMunicipio: -1])
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
	
	def editar(Long id) {
		def personaInstance = Persona.get(id)
		if (!personaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
			redirect(action: "list")
			return
		}

		[personaInstance: personaInstance]
	}
	
	def actualizar(Long id) {
		def personaInstance = Persona.get(id)		
		def direccionInstance = Direccion.get(personaInstance.direcciones.id.get(0))
		def puestoPersonaInstance = PuestoPersona.get(personaInstance.puestosPersona.id.get(0))
		def fotoInstance = personaInstance.getFoto()		
		
		personaInstance.setNombre(personaInstance.getNombre().toUpperCase())
		personaInstance.setMaterno(personaInstance.getMaterno().toUpperCase())
		personaInstance.setPaterno(personaInstance.getPaterno().toUpperCase())
		direccionInstance.setCalle(direccionInstance.getCalle().toUpperCase())
		direccionInstance.setColonia(direccionInstance.getColonia().toUpperCase())
		direccionInstance.setNoExterior(direccionInstance.getNoExterior().toUpperCase())
		direccionInstance.setNoInterior(direccionInstance.getNoInterior().toUpperCase())
		
		direccionInstance.fecha = new Date()
		puestoPersonaInstance.persona = personaInstance
		puestoPersonaInstance.fechaInicio = new Date()
		
		String rfc = params.rfc
		String anio = rfc.substring(4, 6)
		String mes = rfc.substring(6, 8)
		String dia = rfc.substring(8, 10)
		Date fecha = new Date(Integer.parseInt(anio), Integer.parseInt(mes)-1, Integer.parseInt(dia))
		
		personaInstance.fechaNacimiento = fecha		
		personaInstance.curp = personaInstance.curp.toString().toUpperCase()
		personaInstance.rfc = personaInstance.rfc.toString().toUpperCase()
		
		personaInstance.addToDirecciones(direccionInstance)
		personaInstance.addToPuestosPersona(puestoPersonaInstance)
		personaInstance.setFoto(fotoInstance)
		personaInstance.telefonos.clear()
		
		int cantidad = 0
		if(params.cantidad!='')
			cantidad = params.cantidad
	   
	   for(int i=1; i<=cantidad; i++ ){
		   if((params.get("num"+i))!=null){
			   Telefono tel = new Telefono()
			   tel.setFecha(new Date())
			   tel.setTelefono(params.get("num"+i))
			   tel.tipoTelefono = TipoTelefono.findByTipo(params.get("tipo"+i).toString().trim())
			   personaInstance.addToTelefonos(tel)
		   }
	   }
	   
	   personaInstance.properties = params
	   if (!personaInstance.save(flush: true)) {
            render(view: "editar", model: [personaInstance: personaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
		redirect(action: "empleados")
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
	
	def buscarPersona (Integer max) {
		def personas, personas2, personas3
		def personaInstanceList
		def personaInstanceTotal
		params.max = Math.min(max ?: 10, 100)				
		def tipoBusqueda = params.tipo			
		def persona = params.persona
		if (!params.persona.equals("")){
			switch(tipoBusqueda){
				case '0':
					personas = Persona.findAllByNombreLikeOrPaternoLikeOrMaternoLike("%"+persona+"%", "%"+persona+"%", "%"+persona+"%", [max: 5, offset: 0, sort: "nombre", order: "desc"])
					break
				case '1':
					personas = Persona.findAllByNombreLike("%"+persona+"%", [max: 5, offset: 0, sort: "nombre", order: "desc"])
					break
				case '2':
					personas = Persona.findAllByPaternoLikeOrMaternoLike("%"+persona+"%", "%"+persona+"%", [max: 5, offset: 0, sort: "nombre", order: "desc"])
					break
				case '3':
					personas = Persona.findAllByRfcLike("%"+persona+"%", [max: 5, offset: 0, sort: "nombre", order: "desc"])
					break
				case '4':
					personas = Persona.findAllByCurpLike("%"+persona+"%", [max: 5, offset: 0, sort: "nombre", order: "desc"])
					break
			}			
			
			personaInstanceList = personas
			personaInstanceTotal = personas.count
		}else{						
			personaInstanceList = Persona.list(params)
			personaInstanceTotal = Persona.count()
		}
		
		
		render (template:'tablaPersonas', model: [ personaInstanceList: personaInstanceList, personaInstanceTotal: personaInstanceTotal])
		
	}
}
