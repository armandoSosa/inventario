package com.redoaxaca

import groovy.json.JsonSlurper
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.dao.DataIntegrityViolationException

class DepartamentoController {
	def scaffold = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	def listar = {
	}

	def modificar = {
	
	}
	
	def eliminar = {
	
	}
	
	def insertar = {
	
	}
	
	def insertar2 = {
	
	}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [departamentoInstanceList: Departamento.list(params), departamentoInstanceTotal: Departamento.count()]
    }
	
	def menu(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[departamentoInstanceList: Departamento.list(params), departamentoInstanceTotal: Departamento.count()]
	}
	
	def menu2(Integer max) {
		//params.max = Math.min(max ?: 10, 100)
		//[departamentoInstanceList: Departamento.list(params), departamentoInstanceTotal: Departamento.count()]
		//[[{v : '1',	f : 'Mike'}, '', '' ],[{v : '2', f : 'Jim'}, '1', '' ], [ {v : '3',f : 'Alice'}, '1', '' ], [ {v : '4', f : 'Bob'}, '2', '' ], [ {v : '5', f : 'Carol'}, '4', 'hola' ] ]
		def departamentos = Departamento.list();
		
		JSONArray arrayRaiz=new JSONArray();
		ArrayList<Long> idDepartamentos = new ArrayList<Long>();
		for (Departamento d in departamentos) {
			for (Departamento s in d.departamentos) {
				idDepartamentos.add(s.id);
				JSONArray arrayObj=new JSONArray();
				JSONObject jsonDepartamento = new JSONObject();
				jsonDepartamento.put('v', s.id.toString());
				jsonDepartamento.put('f', s.nombre);
				
				arrayObj.put(jsonDepartamento);
				arrayObj.put(d.id.toString());
				arrayObj.put('');
				arrayRaiz.put(arrayObj);
			}
		}
		//buscamos el departamento raiz
		Departamento raiz = departamentos.get(0);
		JSONArray arrayObj=new JSONArray();
		JSONObject jsonDepartamento = new JSONObject();
		jsonDepartamento.put('v', raiz.id.toString());
		jsonDepartamento.put('f', raiz.nombre);
		System.out.println(raiz.nombre);
		
		arrayObj.put(jsonDepartamento);
		arrayObj.put('');
		arrayObj.put('');
		arrayRaiz.put(arrayObj);
		
		System.out.println(arrayRaiz.toString());
		[datos: arrayRaiz.toString()]
	}
	
	
	
    def create() {
        [departamentoInstance: new Departamento(params)]
    }

    def save() {
        def departamentoInstance = new Departamento(params)
        if (!departamentoInstance.save(flush: true)) {
            render(view: "create", model: [departamentoInstance: departamentoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamentoInstance.id])
        redirect(action: "show", id: departamentoInstance.id)
    }
	
	def save_departamento() {
		def departamentoInstance = new Departamento(params)
		if (!departamentoInstance.save(flush: true)) {
			render(view: "insertar", model: [departamentoInstance: departamentoInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamentoInstance.id])
		redirect(action: "menu")
	}
	
	def save_departamento_puesto(){
		def departamentoInstance = new Departamento(params)
		if (!departamentoInstance.save(flush: true)) {
			flash.message = "No se puede crear el departamento"
			render(view: "insertar", controller: "puesto", model: [departamentoInstance: departamentoInstance])
			return
		}		
		redirect(action: "insertar", controller: "puesto", model: [departamentoInstance: departamentoInstance])

	}

    def show(Long id) {
        def departamentoInstance = Departamento.get(id)
        if (!departamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
            return
        }

        [departamentoInstance: departamentoInstance]
    }

    def edit(Long id) {
        def departamentoInstance = Departamento.get(id)
        if (!departamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
            return
        }

        [departamentoInstance: departamentoInstance]
    }

    def update(Long id, Long version) {
        def departamentoInstance = Departamento.get(id)
        if (!departamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (departamentoInstance.version > version) {
                departamentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'departamento.label', default: 'Departamento')] as Object[],
                          "Another user has updated this Departamento while you were editing")
                render(view: "edit", model: [departamentoInstance: departamentoInstance])
                return
            }
        }

        departamentoInstance.properties = params

        if (!departamentoInstance.save(flush: true)) {
            render(view: "edit", model: [departamentoInstance: departamentoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamentoInstance.id])
        redirect(action: "show", id: departamentoInstance.id)
    }

    def delete(Long id) {
        def departamentoInstance = Departamento.get(id)
        if (!departamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
            return
        }

        try {
            departamentoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def save_departamentos() {
		def slurper = new JsonSlurper()
		def result = slurper.parseText(params.datos);
		System.out.println("entro");
		//for (int i=0; i<result.rows.size(); i++) {
			//System.out.println(result.rows[i].c[0].v+"; label: "+result.rows[i].c[0].f+"; padre: '"+result.rows[i].c[1].v+"'");	
		//}
		
		//organizamos a los hijos
		Departamento depto;
		//buscamos el elemento que no tenga padre
		for (int i=0; i<result.rows.size(); i++) {
			if(result.rows[i].c[1].v.equals("")) {
				//System.out.println("el padre es: "+result.rows[i].c[0].f);
				depto = new Departamento(nombre: result.rows[i].c[0].f);
				buscarSubDepartamentos(depto, result.rows[i].c[0].v, result);
			}
		}
		if (depto) {
			if (!depto.save(flush: true)) {
				System.out.println("se guardaron los departamentos");
			} else {
				System.out.println(" "+depto.getNombre());
			}
		} else  {
			System.out.println("depto no definido");
		}
		
		
	}
	
	void buscarSubDepartamentos(Departamento depto, String idPadre, HashMap result) {
		for (int i=0; i<result.rows.size(); i++) {
			if(result.rows[i].c[1].v.equals(idPadre)) {
				Departamento sub = new Departamento(nombre: result.rows[i].c[0].f);
				buscarSubDepartamentos(sub, result.rows[i].c[0].v, result);
				depto.addToDepartamentos(sub);
			}
		}
	}
}
