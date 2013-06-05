package com.redoaxaca

class ObjetoPersonaController {
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
	
	def insertar2 = {
		def objetosList = Objeto.list()
		
		
		objetosList = Objeto.findAll("\
			from \
			ObjetoPersona as op\
			where op.fechaInicio = op.fechaFin") 

		def criterio = Objeto.createCriteria();
		def objetos = criterio.listDistinct {
			not {'in'("id", objetosList.objeto.id)}
		}
				
		[objetoPersonaInstance: new ObjetoPersona(params), personaInstance: new Persona(params), objetosList: objetos]
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
		//Buscamos la información de la persona
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
			objeto.fechaFin = objeto.fechaInicio
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
