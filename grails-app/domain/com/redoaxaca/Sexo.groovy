package com.redoaxaca

class Sexo {
	String sexo
	
	static hasMany = [personas: Persona]
	
    static constraints = {
		sexo(unique:true)
    }
	
	String toString(){
		"${sexo}"
	}
}
