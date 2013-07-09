import com.redoaxaca.*

class BootStrap {

    def init = { servletContext ->
		environments{
			development{
				new TipoTelefono(tipo: "CASA").save()
				new TipoTelefono(tipo: "OFICINA").save()
				new Sexo(sexo: "MASCULINO").save()
				def sexo = new Sexo(sexo: "FEMENINO").save()
				def estado = new Estado(nombre:"OAXACA").save()
				new Municipio(nombre:"SANTA LUCIA", estado: estado).save()
				def municipio = new Municipio(nombre:"CENTRO", estado: estado).save()				
				def departamento = new Departamento(nombre:"DEPTO1").save()
				def nivel = new Nivel(nivel:"10").save()
				def puesto = new Puesto(nombre:"GERENTE", departamento:departamento, nivel: nivel).save()
				/*														
				def direccion = new Direccion(calle:"REFORMA", colonia:"REFORMA", noExterior: "312", fecha:new Date(), municipio: municipio).save()
				def persona = new Persona(nombre:"RENE", paterno:"CORDERO", materno:"ARELLANES", curp:"RENE010101FTRERT01", rfc:"RENE010101FTR", numeroEmpleado: "1" ,fechaNacimiento:new Date(), email:"rene@gmail.com", direcciones:direccion, sexo: sexo)				
				def puestoPersonaInstance = new PuestoPersona(fechaInicio: new Date(), persona:persona, puesto: puesto)
				persona.addToPuestosPersona(puestoPersonaInstance)				
				persona.save()
				*/
			}
		}
    }
    def destroy = {
    }
}
