package com.redoaxaca

import java.awt.image.BufferedImage
import javax.imageio.ImageIO
import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class FotoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def scaffold = true
	def s3ImageService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [fotoInstanceList: Foto.list(params), fotoInstanceTotal: Foto.count()]
    }

    def create() {
        [fotoInstance: new Foto(params)]
    }

    def save() {
        def fotoInstance = new Foto(params)
        if (!fotoInstance.save(flush: true)) {
            render(view: "create", model: [fotoInstance: fotoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'foto.label', default: 'Foto'), fotoInstance.id])
        redirect(action: "show", id: fotoInstance.id)
    }
	
	def save_foto() {
		def fotoInstance = new Foto(params)
		if (!fotoInstance.save(flush: true)) {
			render(view: "create", model: [fotoInstance: fotoInstance])
			return
		}
		redirect(action: "insertar2", controller: "persona", id: fotoInstance.id)		
	}
	
	def modificar_foto() {
		System.out.println(params)
		def fotoInstance = Foto.get(params.idfoto)
		
		//def photoS3Object = request.getInputStream().get
				
				
		def imageCrooped = cropping(photoS3Object)
		
		System.out.println("idfoto:"+params.idfoto+"."+params.foto)
				
		fotoInstance.foto = imageCrooped
		if (!fotoInstance.save(flush: true)) {
			render(view: "create", model: [fotoInstance: fotoInstance])
			return
		}
		redirect(action: "insertar2", controller: "persona", id: fotoInstance.id)
	}
	

    def show(Long id) {
        def fotoInstance = Foto.get(id)
        if (!fotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foto.label', default: 'Foto'), id])
            redirect(action: "list")
            return
        }

        [fotoInstance: fotoInstance]
    }

    def edit(Long id) {
        def fotoInstance = Foto.get(id)
        if (!fotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foto.label', default: 'Foto'), id])
            redirect(action: "list")
            return
        }

        [fotoInstance: fotoInstance]
    }

    def update(Long id, Long version) {
        def fotoInstance = Foto.get(id)		
        if (!fotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foto.label', default: 'Foto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (fotoInstance.version > version) {
                fotoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'foto.label', default: 'Foto')] as Object[],
                          "Another user has updated this Foto while you were editing")
                render(view: "edit", model: [fotoInstance: fotoInstance])
                return
            }
        }

        fotoInstance.properties = params

        if (!fotoInstance.save(flush: true)) {
            render(view: "edit", model: [fotoInstance: fotoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'foto.label', default: 'Foto'), fotoInstance.id])
        redirect(action: "show", id: fotoInstance.id)
    }

    def delete(Long id) {
        def fotoInstance = Foto.get(id)
        if (!fotoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foto.label', default: 'Foto'), id])
            redirect(action: "list")
            return
        }

        try {
            fotoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'foto.label', default: 'Foto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'foto.label', default: 'Foto'), id])
            redirect(action: "show", id: id)
        }
    }
	
	
	

private cropping(photoFromS3){
		  
  def posx   = parseIntTheValueDoubleAsString(params.x)
  def posy   = parseIntTheValueDoubleAsString(params.y)
  def width  = parseIntTheValueDoubleAsString(params.w)
  def height = parseIntTheValueDoubleAsString(params.h)  
	  BufferedImage image = ImageIO.read(photoFromS3)		    	 
  withException{
	  def position_y = calculatePositonHeight(height,posy,image.height)
	  def position_x = calculatePositonWidth(width,posx,image.width)

	  return image.getSubimage( position_x, position_y , width , height )
  }

}

private withException(closure){
  try{
	 closure()
  }catch(all){
	log.error "Error when cropping image",all
		 
  }
}
  
private parseIntTheValueDoubleAsString(value){
  Double.parseDouble(value) as Integer
}

private calculatePositonHeight(height,posy,heightOriginal){

  if(isHeightOutOfRaster(height,posy,heightOriginal)){
	  return heightOriginal - height
  }
  return posy
}
private calculatePositonWidth(width,posx,widthOriginal){
	  
  if(isWidthOutOfRaster(width,posx,widthOriginal)){
	  return widthOriginal - width
  }
  return posx
}

private isHeightOutOfRaster(height,posy,heightOriginal){
  height + posy > heightOriginal
}
private isWidthOutOfRaster(width,posx,widthOriginal){
  width + posx > widthOriginal
}
}
