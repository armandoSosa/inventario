package com.redoaxaca

class Foto {
	byte[] foto
	
    static constraints = {
		foto(nullable: false, maxSize:104857632)
    }
	
	static mapping = {
		foto column:"foto", sqlType: "blob"
	}
	
	static hasMany = [personas : Persona]
}
