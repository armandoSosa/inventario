package com.redoaxaca

class Foto {
	byte[] foto
	
    static constraints = {
		foto(nullable: false, maxSize:1048576)
    }
	
	static hasMany = [personas : Persona]
}
