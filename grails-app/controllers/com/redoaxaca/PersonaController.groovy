package com.redoaxaca

import java.awt.print.Printable;

import org.springframework.dao.DataIntegrityViolationException

class PersonaController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def scaffold = true

	def inicio (Integer max) {
		params.max = Math.min(max ?: 10, 100)		
		[personaInstanceList: Persona.findAllByArchivado("false", [max: max, offset: 0, sort: params.sort, order: params.order]), personaInstanceTotal: Persona.count()]		
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
		//def fotoInstance = new Foto(params)
		System.out.println("idfoto:"+params.idfoto)
		
		//fotoInstance.save(flush: true)

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
				 tel.tipoTelefono = TipoTelefono.get(params.get("tipo"+i))
				 System.out.println("tel:"+tel.telefono+" tipo:"+tel.tipoTelefono)				 
				 personaInstance.addToTelefonos(tel)
			 }
		 }
		 
		if (!personaInstance.save(flush: true)) {
			def departamentoInstance = Departamento.get(personaInstance?.puestosPersona?.puesto?.departamento?.id?.get(personaInstance?.puestosPersona?.size()-1))
			//Se obtiene la lista de puestos
			def puestosList = departamentoInstance?.puestos
			
			def estadoInstance = Estado.get(personaInstance?.direcciones?.municipio?.estado?.id?.get(personaInstance?.direcciones?.size()-1))
			//Se obtiene la lista de municipio
			def municipiosList = estadoInstance?.municipios
			flash.error = "No se pudo insertar"
			render(view: "insertar2", model: [personaInstance: personaInstance, direccionInstance: direccionInstance, puestoPersonaInstance: puestoPersonaInstance, puestosList: puestosList, municipiosList:municipiosList])
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
			redirect(action: "inicio")
			return
		}

		[personaInstance: personaInstance]
	}
	
	def archivar(Long id){
		def personaInstance = Persona.get(id)
		personaInstance.archivado = true
		if (!personaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
			redirect(action: "list")
			return
		}

		if (!personaInstance.save(flush: true)) {
			render(view: "editar", model: [personaInstance: personaInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
		redirect(action: "mostrar", id: personaInstance.id)
		
	}

	def editar(Long id) {
		def personaInstance = Persona.get(id)
		
		def departamentoInstance = Departamento.get(personaInstance?.puestosPersona?.puesto?.departamento?.id?.get(personaInstance?.puestosPersona?.size()-1))		
		//Se obtiene la lista de puestos
		def puestosList = departamentoInstance?.puestos
		
		def estadoInstance = Estado.get(personaInstance?.direcciones?.municipio?.estado?.id?.get(personaInstance?.direcciones?.size()-1))
		//Se obtiene la lista de municipio
		def municipiosList = estadoInstance?.municipios
		
		System.out.println("tam:"+departamentoInstance?.puestos)
		
		if (!personaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
			redirect(action: "mostrar")
			return
		}

		[personaInstance: personaInstance, puestosList: puestosList, municipiosList:municipiosList]
	}

	def actualizar(Long id) {
		def personaInstance = Persona.get(id)
		def direccionInstance = Direccion.get(personaInstance.direcciones.id.get(0))
		def puestoPersonaInstance = PuestoPersona.get(personaInstance.puestosPersona.id.get(0))
		def fotoInstance = personaInstance.getFoto()

		personaInstance.properties = params
		personaInstance.setNombre(personaInstance.getNombre().toUpperCase())
		personaInstance.setMaterno(personaInstance.getMaterno().toUpperCase())
		personaInstance.setPaterno(personaInstance.getPaterno().toUpperCase())

		direccionInstance.properties = params
		direccionInstance.setCalle(direccionInstance.getCalle().toUpperCase())
		direccionInstance.setColonia(direccionInstance.getColonia().toUpperCase())
		direccionInstance.setNoExterior(direccionInstance.getNoExterior().toUpperCase())
		direccionInstance.setNoInterior(direccionInstance.getNoInterior().toUpperCase())

		puestoPersonaInstance.properties = params
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

		
		 				 
		 int cantidad = 0
		 if(params.cantidad!='')
		 	cantidad = params.cantidad
		 /*personaInstance.telefonos.eachWithIndex(){tel, i ->
		 tel.fecha = new Date()
		 tel.tipoTelefono = TipoTelefono.findByTipo(params.get("tipo"+i+1).toString().trim())
		 tel.setTelefono(params.get("num"+i+1))
		 System.out.println("tipo:"+tel.tipoTelefono+".tel:"+tel.telefono)
		}*/
		def telefonos = []
		System.out.println(personaInstance.telefonos.isEmpty())
		personaInstance.telefonos.eachWithIndex(){tel, i ->
			if(params.get("num"+(i+1))!=null){			
				tel.setTelefono(params.get("num"+(i+1)))
				tel.tipoTelefono = TipoTelefono.get(params.get("tipo"+(i+1)))
				System.out.println("numero:"+params.get("num"+(i+1))+".i:"+i)
			}else{
				telefonos.add(tel)
				//personaInstance.removeFromTelefonos(tel)
			}
		}
		
		telefonos.each { tel ->
			personaInstance.removeFromTelefonos(tel)
		}
		
		if(personaInstance.telefonos.isEmpty()){
			 for(int i=1; i<=cantidad; i++ ){
				 if((params.get("num"+i))!=null){
					 Telefono tel = new Telefono()				 
					 tel.setFecha(new Date())
					 tel.setTelefono(params.get("num"+i))
					 tel.tipoTelefono = TipoTelefono.get(params.get("tipo"+i))			   
					 personaInstance.addToTelefonos(tel)
				 }
			 }
		}else if(cantidad>personaInstance.telefonos.size()){
			personaInstance.telefonos.eachWithIndex(){tel, i ->
				telefonos.add(tel)
				//personaInstance.removeFromTelefonos(tel)
			}
			telefonos.each { tel ->
				personaInstance.removeFromTelefonos(tel)
			}
			for(int i=1; i<=cantidad; i++ ){
				if((params.get("num"+i))!=null){
					Telefono tel = new Telefono()
					tel.setFecha(new Date())
					tel.setTelefono(params.get("num"+i))
					tel.tipoTelefono = TipoTelefono.get(params.get("tipo"+i))
					personaInstance.addToTelefonos(tel)
				}
			}
		}
		
		 

		if (!personaInstance.save(flush: true)) {
			def departamentoInstance = Departamento.get(personaInstance?.puestosPersona?.puesto?.departamento?.id?.get(personaInstance?.puestosPersona?.size()-1))
			//Se obtiene la lista de puestos
			def puestosList = departamentoInstance?.puestos
			
			def estadoInstance = Estado.get(personaInstance?.direcciones?.municipio?.estado?.id?.get(personaInstance?.direcciones?.size()-1))
			//Se obtiene la lista de municipio
			def municipiosList = estadoInstance?.municipios
			
			render(view: "editar", model: [personaInstance: personaInstance, puestosList: puestosList, municipiosList:municipiosList])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
		redirect(action: "mostrar", id: personaInstance.id)
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
		//System.out.println(params)
		def personas, personas2, personas3, estados
		def personaInstanceList
		def personaInstanceTotal
		params.max = Math.min(max ?: 10, 100)
		def tipoBusqueda = params.tipo
		def persona = params.persona
		if (!params.persona.equals("")){
			if(params.archivado=="true"){
				switch(tipoBusqueda){
					case '0':
						personas = Persona.findAllByNombreLikeOrPaternoLikeOrMaternoLike("%"+persona+"%", "%"+persona+"%", "%"+persona+"%", [max: max, offset: 0, sort: params.sort, order: params.order])
						break
					case '1':					
						personas = Persona.findAllByNumeroEmpleadoLike("%"+persona+"%", [max: max, offset: 0, sort: params.sort, order: params.order])
						break
					case '2':
						def criterio = Persona.createCriteria()
						personas = criterio{
							direcciones{
								municipio{
									estado{
										like("nombre", persona+"%")										
									}
								}
							}
						}						
												
						break
					case '3':
						personas = Persona.findAllByRfcLike("%"+persona+"%", [max: max, offset: 0, sort: params.sort, order: params.order])
						break
					case '4':
						personas = Persona.findAllByCurpLike("%"+persona+"%", [max: max, offset: 0, sort: params.sort, order: params.order])
						break
				}
			}else{
				switch(tipoBusqueda){
					case '0':
						personas = Persona.findAllByNombreLikeOrPaternoLikeOrMaternoLike("%"+persona+"%", "%"+persona+"%", "%"+persona+"%", [max: max, offset: 0, sort: params.sort, order: params.order])
						def aux = Persona.findAllByArchivado("true")
						personas.removeAll(aux)
						break
					case '1':												
						personas = Persona.findAllByNumeroEmpleadoLikeAndArchivado("%"+persona+"%", false, [max: max, offset: 0, sort: params.sort, order: params.order])						
						break
					case '2':																	
						def criterio = Persona.createCriteria()
						personas = criterio{
							direcciones{
								municipio{
									estado{
										like("nombre", persona+"%")										
									}
								}
							}
							eq("archivado", false)
						}						
						break
					case '3':
						personas = Persona.findAllByRfcLikeAndArchivado("%"+persona+"%", false, [max: max, offset: 0, sort: params.sort, order: params.order])
						break
					case '4':
						personas = Persona.findAllByCurpLikeAndArchivado("%"+persona+"%", false, [max: max, offset: 0, sort: params.sort, order: params.order])
						break
				}
			}			
			personaInstanceList = personas
			personaInstanceTotal = personas.count
		}else{
			if(params.archivado=="true"){
				personaInstanceList = Persona.findAll([max: max, offset: 0, sort: params.sort, order: params.order])
			}else{
				personaInstanceList = Persona.findAllByArchivado("false", [max: max, offset: 0, sort: params.sort, order: params.order])
			}
			
			personaInstanceTotal = Persona.count()
		}	
		if(!max){
			render (template:'tablaPersonas', model: [ archivado: params.archivado, tipo: params.tipo, persona:params.persona, personaInstanceList: personaInstanceList, personaInstanceTotal: personaInstanceTotal, max:max])
		}else{
			render (view:'inicio', model: [ archivado: params.archivado, tipo: params.tipo, persona:params.persona, personaInstanceList: personaInstanceList, personaInstanceTotal: personaInstanceTotal, max:max])
		}
				
	}
}