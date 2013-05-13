package com.redoaxaca

import org.springframework.dao.DataIntegrityViolationException

class PlantillaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def plantillaService

    def index() {
        redirect(action: "list", params: params)
    }

	
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [plantillaInstanceList: Plantilla.list(params), plantillaInstanceTotal: Plantilla.count()]
    }

    def create() {
        [plantillaInstance: new Plantilla(params)]
    }

    def save() {
        def plantillaInstance = new Plantilla(params)
        if (!plantillaInstance.save(flush: true)) {
            render(view: "create", model: [plantillaInstance: plantillaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'plantilla.label', default: 'Plantilla'), plantillaInstance.id])
        redirect(action: "show", id: plantillaInstance.id)
    }

    def show(Long id) {
        def plantillaInstance = Plantilla.get(id)
        if (!plantillaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plantilla.label', default: 'Plantilla'), id])
            redirect(action: "list")
            return
        }

        [plantillaInstance: plantillaInstance]
    }

    def edit(Long id) {
        def plantillaInstance = Plantilla.get(id)
        if (!plantillaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plantilla.label', default: 'Plantilla'), id])
            redirect(action: "list")
            return
        }

        [plantillaInstance: plantillaInstance]
    }

    def update(Long id, Long version) {
        def plantillaInstance = Plantilla.get(id)
        if (!plantillaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plantilla.label', default: 'Plantilla'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (plantillaInstance.version > version) {
                plantillaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'plantilla.label', default: 'Plantilla')] as Object[],
                          "Another user has updated this Plantilla while you were editing")
                render(view: "edit", model: [plantillaInstance: plantillaInstance])
                return
            }
        }

        plantillaInstance.properties = params

        if (!plantillaInstance.save(flush: true)) {
            render(view: "edit", model: [plantillaInstance: plantillaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'plantilla.label', default: 'Plantilla'), plantillaInstance.id])
        redirect(action: "show", id: plantillaInstance.id)
    }

    def delete(Long id) {
        def plantillaInstance = Plantilla.get(id)
        if (!plantillaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plantilla.label', default: 'Plantilla'), id])
            redirect(action: "list")
            return
        }

        try {
            plantillaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'plantilla.label', default: 'Plantilla'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'plantilla.label', default: 'Plantilla'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def insertar2(Long id) {
		def tipoInstance = Tipo.get(id)
        if (!tipoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipo.label', default: 'Tipo'), id])
            redirect(action: "list")
            return
        }
		def criterio = Plantilla.createCriteria()
		
		def plantillas = criterio.listDistinct {
			tipo {
				eq 'id', id
			}
		}

		def criterio2 = Caracteristica.createCriteria();
		def caracteristicasNoAgregadas = criterio2.listDistinct {
			not {'in'("id", plantillas.caracteristica.id)}
		}

        [tipoInstance: tipoInstance, caracteristicas: caracteristicasNoAgregadas, plantillas:plantillas]
	}
	
	def save_plantilla() {
		System.out.println(params)

		//por cada id de caracter��stica, agregamos una plantilla
		
		def criterio = Plantilla.createCriteria()
		def plantillas = criterio.listDistinct {
			tipo {
				eq ('id', Long.parseLong(params.idTipo))
			}
		}
		for (String idString in params.caracteristicas) {
			//Buscamos las caracter��sticas que ya est��n en las plantillas para que no se agreguen
				boolean esta=false
				for (Plantilla p in plantillas) {
					if (p.id.toString().equals(idString)) {
						esta=true
					}
				}
				if (!esta) {
					try {
						def nuevaPlantilla = plantillaService.crearPlantilla(Long.parseLong(idString), Long.parseLong(params.idTipo))
					} catch (PlantillaException pe) {
						//flash.message = pe.message
						System.out.println(pe.message)
					}
				}
				
		}
		redirect(controller:"tipo", action: "show", id: Long.parseLong(params.idTipo))
		
	}
}
