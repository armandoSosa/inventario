package com.redoaxaca

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics
import java.awt.Graphics2D;
import java.awt.Image
import java.awt.RenderingHints;
import java.awt.event.ItemEvent;
import java.awt.geom.Rectangle2D
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte
import java.awt.image.ImageFilter
import java.awt.image.ImageProducer;
import java.awt.image.RGBImageFilter
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import java.awt.Toolkit;

public class ImageUtils {

	public static File loadImageByte(byte[] fileBytes){
		File file = new File("web-app/images/perfil/prueba.jpg");
		FileOutputStream stream = new FileOutputStream(file);
		try {
			stream.write(fileBytes);
		} finally {
			stream.close();
		}				
		return file;
	 }
	 
	
	public static byte[] convertirBufferedImageABytes(String path){		
		File file = new File(path);		
		byte[] b = new byte[(int) file.length()];
			try {
			   FileInputStream fileInputStream = new FileInputStream(file);
			   fileInputStream.read(b);					   
			} catch (FileNotFoundException e) {							  
			 	e.printStackTrace();
			}
			catch (IOException e1) {					
				e1.printStackTrace();
			}
		return b;		
	}
	
	 	
/**
* Carga una variable BufferedImage desde un archivo tipo imagen
*
* @param pathname la ruta en el disco del archivo de la imagen
* 
* @return BufferedImage con la imagen cargada desde el archivo
*/
public static BufferedImage loadImage(String pathname) {
	BufferedImage bufim = null;
	bufim = ImageIO.read(new File(pathname));	
	return bufim;
}
/**
* Redimensiona una imagen BufferedImage
*
* @param bufferedImage la imagen que se desea redimensionar
* @param newW el nuevo ancho que se desea redimensionar
* @param newH el nuevo alto que se desea redimensionar
*
* @return BufferedImage redimensionada
*/
public static BufferedImage resize(BufferedImage bufferedImage, int newW, int newH) {
	int w = bufferedImage.getWidth();
	int h = bufferedImage.getHeight();
	def reduccionW= (newW*100)/w
	def reduccionH=(newH*100)/h
	
	int newHx = h * (reduccionH/100)
	int newWy= w * (reduccionW/100)
	
	BufferedImage bufim = new BufferedImage(newW, newH, bufferedImage.getType());
	Graphics2D g = bufim.createGraphics();
	g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
	g.drawImage(bufferedImage, 0, 0, newWy, newHx, 0, 0, w, h, null);
	g.dispose();
	return bufim;
}

public static BufferedImage resizeHeight(BufferedImage bufferedImage, int reduccion, boolean porcentaje) {
	int w = bufferedImage.getWidth();
	int h = bufferedImage.getHeight();
	int newH = h * (reduccion/100)
	int newW= w * (reduccion/100)
	
	if (porcentaje){
	newH = reduccion
	def porcReduccion = reduccion * 100 / h
	newW = w * (porcReduccion/100)
	
	}
	BufferedImage bufim = new BufferedImage(newW, newH, bufferedImage.getType());
	Graphics2D g = bufim.createGraphics();
	g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
	g.drawImage(bufferedImage, 0, 0, newW, newH, 0, 0, w, h, null);
	g.dispose();
	return bufim;
	}


/**
* Redimensiona una imagen pero en decrementos constantes y en proporciones en base al tamaño
* original de la imagen.
* @param bufferedImage La imagen a redimensionar
* @param reduccion La unidada de reducción, en base al parametro porcentaje
* @param porcentaje Si es true, reduccion se toma como porcentaje igual en ancho y alto,
* de lo contrario, reduccion se toma como pixeles y se calcula la altura en base al porcentaje
* proporcional
* @return
*/
public static BufferedImage resize(BufferedImage bufferedImage, int reduccion, boolean porcentaje) {
int w = bufferedImage.getWidth();
int h = bufferedImage.getHeight();
int newH = h * (reduccion/100)
int newW= w * (reduccion/100)

if (porcentaje){
newW = reduccion
def porcReduccion = reduccion * 100 / w
newH= h * (porcReduccion/100)

}
BufferedImage bufim = new BufferedImage(newW, newH, bufferedImage.getType());
Graphics2D g = bufim.createGraphics();
g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
g.drawImage(bufferedImage, 0, 0, newW, newH, 0, 0, w, h, null);
g.dispose();
return bufim;
}
//	public static Image TransformGrayToTransparency(BufferedImage image)
//	{
//	 ImageFilter filter = new RGBImageFilter()
//	 {
//	 public final int filterRGB(int x, int y, int rgb)
//	 {
//	 return (rgb <<  & 0xFF000000;
//	 }
//	 };
//
//	 ImageProducer ip = new FilteredImageSource(image.getSource(), filter);
//	 return Toolkit.getDefaultToolkit().createImage(ip);
//	}
/**
* metodo que sobre pone una imagen en una buferedimagen
*
* @param image bufered imagen de fondo
* @param mask imagen para mascara
*
* @return regresa una buferedimagen
*/
public static BufferedImage ApplyTransparency(BufferedImage image, Image mask)
{
BufferedImage dest = new BufferedImage(
image.getWidth(), image.getHeight(),
BufferedImage.OPAQUE);
Graphics2D g2 = dest.createGraphics();
g2.drawImage(image, 0, 0, null);

//generamos una marca de agua para agregar texto
AlphaComposite ac = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.3F);
g2.setComposite(ac);
g2.setColor(Color.white);
g2.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING,
RenderingHints.VALUE_TEXT_ANTIALIAS_ON)
g2.setFont(new Font("Arial", Font.BOLD, 30))
String watermark = "Red Oaxaca de Todos - 2012"
FontMetrics fontMetrics = g2.getFontMetrics()
Rectangle2D rect = fontMetrics.getStringBounds(watermark, g2)

int centerX = (image.getWidth() - (int) mask.getWidth()) / 2
int centerY = (image.getHeight() - (int) mask.getHeight()) / 2
//g2.drawString(watermark, 100, 100)
//	 g2.drawString(watermark, centerX, centerY-200)
//carga mascara
g2.drawImage(mask,centerX ,centerY, null) 
g2.dispose();
return dest;
}
/////////////////////////////////
/**
* Rota una imagen BufferedImage
*
* @param bufferedImage la imagen que se desea rotar
* @param angle los grados que se desea rotar
*
* @return BufferedImage rotada
*/
public static BufferedImage rotate(BufferedImage bufferedImage, int angle) {
int w = bufferedImage.getWidth();
int h = bufferedImage.getHeight();
BufferedImage bufim = new BufferedImage(w, h, bufferedImage.getType());
Graphics2D g = bufim.createGraphics();
g.rotate(Math.toRadians(angle), w / 2, h / 2);
g.drawImage(bufferedImage, null, 0, 0);
return bufim;
}
/**
* Guarda una BufferedImage al disco en formato ".png" o ".jpg"
*
* @param bufferedImage la imagen que se desea guardar
* @param pathname la ruta del archivo en el cual se desea guardar la imagen incluyendo el nombre del archivo y su formato
*/
public static void saveImage(BufferedImage bufferedImage, String pathname) {
	try {
		String format = (pathname.endsWith(".png")) ? "png" : "jpg";
		ImageIO.write(bufferedImage, format, new File(pathname));
	} catch (IOException e) {
		e.printStackTrace();
	}
}
/**
* Le aplica la transparencia seleccionada a una BufferedImage
*
* @param bufferedImage la imagen que se desea hacer transparente algun color
* @param transparency variable tipo <code>float</code> entre el rango 0.0 - 1.0 que indica el porcentaje de transparencia
*
* @return BufferedImage con el porcentaje de transparencia seleccionada
*/
public static BufferedImage makeTranslucentImage(BufferedImage bufferedImage, float transparency) {
BufferedImage bufim = new BufferedImage(bufferedImage.getWidth(), bufferedImage.getHeight(), BufferedImage.TRANSLUCENT);
Graphics2D g = bufim.createGraphics();
g.setComposite(AlphaComposite.getInstance(AlphaComposite.CLEAR, transparency.bitmap));
g.drawImage(bufferedImage, null, 0, 0);
g.dispose();
return bufim;
}
/**
* Hace que el color seleccionado sea transparente en un BufferedImage
*
* @param bufferedImage la imagen que se desea hacer transparente algun color
* @param color el color que se desea hacer transparente
*
* @return BufferedImage con el color seleccionado transparente
*/
public static BufferedImage makeColorTransparent(BufferedImage bufferedImage, Color color) {
BufferedImage bufim = new BufferedImage(bufferedImage.getWidth(), bufferedImage.getHeight(), BufferedImage.TYPE_INT_ARGB);
Graphics2D g = bufim.createGraphics();
g.setComposite(AlphaComposite.Src);
g.drawImage(bufferedImage, null, 0, 0);
g.dispose();
for (int i = 0; i < bufim.getHeight(); i++) {
for (int j = 0; j < bufim.getWidth(); j++) {
if (bufim.getRGB(j, i) == color.getRGB()) {
bufim.setRGB(j, i, 0x8F1C1C);
}
}
}
return bufim;
}
/**
*
* @param bufferedImage a transformar
*
* @return una imagen
*/
public static Image toImage(BufferedImage bufferedImage) {
return Toolkit.getDefaultToolkit().createImage(bufferedImage.getSource());
}
/**
* Corta una BufferedImage en filas y/o columnas del mismo tamaño
*
* @param bufferedImage la imagen que se desea cortar
* @param rows el numero filas en las que se desea cortar la imagen
* @param cols el numero de columnas en las que se desea cortar la image
*
* @return BufferedImare[] devuelve un arreglo tipo BufferedImage con las imagenes cortadas de la imagen original
*/
public static LinkedHashMap splitImage(BufferedImage bufferedImage, int rows, int cols) {
int w = bufferedImage.getWidth() / cols;
int h = bufferedImage.getHeight() / rows;
int num = 0;
LinkedHashMap contenedor = new TreeMap()

for (int y = 0; y < rows; y++) {
for (int x = 0; x < cols; x++) {

String cadena= Long.toHexString(Double.doubleToLongBits(Math.random()))
//imgs[num] = new BufferedImage(w, h, bufferedImage.getType());

contenedor.put(cadena,new BufferedImage(w, h, bufferedImage.getType()))
// Tell the graphics to draw only one block of the image
Graphics2D g = contenedor[cadena].createGraphics();
g.drawImage(bufferedImage, 0, 0, w, h, w * x, h * y, w * x + w, h * y + h, null);
g.dispose();

num++;
}
}

return contenedor
}

public static splitImage2(BufferedImage bufferedImage, int rows, int cols) {
int w = bufferedImage.getWidth() / cols;
int h = bufferedImage.getHeight() / rows;
int num = 0;
TreeMap contenedor = new TreeMap()
//	 HashMap contenedor2 = new HashMap()
//BufferedImage[] imgs = new BufferedImage[w * h];
for (int y = 0; y < rows; y++) {
for (int x = 0; x < cols; x++) {

String cadena= Long.toHexString(Double.doubleToLongBits(Math.random()))
//imgs[num] = new BufferedImage(w, h, bufferedImage.getType());

contenedor.put(cadena,new BufferedImage(w, h, bufferedImage.getType()))
// Tell the graphics to draw only one block of the image
Graphics2D g = contenedor[cadena].createGraphics();
g.drawImage(bufferedImage, 0, 0, w, h, w * x, h * y, w * x + w, h * y + h, null);
g.dispose();

//	 contenedor2.put(num, contenedor)

num++;
}
}

return contenedor
}


/**
* Gira una imagen en sentido vertival
*
* @param bufferedImage la imagen que se desea girar
*
* @return BufferedImage es la imagen girada
*/
public static BufferedImage flipVertical(BufferedImage bufferedImage) {
int w = bufferedImage.getWidth();
int h = bufferedImage.getHeight();
BufferedImage bufim = new BufferedImage(w, h, bufferedImage.getColorModel().getTransparency());
Graphics2D g = bufim.createGraphics();
g.drawImage(bufferedImage, 0, 0, w, h, 0, h, w, 0, null);
g.dispose();
return bufim;
}
/**
* Gira una imagen en sentido horizontal
*
* @param bufferedImage la imagen que se desea girar
*
* @return BufferedImage es la imagen girada
*/
public static BufferedImage flipHorizontal(BufferedImage bufferedImage) {
int w = bufferedImage.getWidth();
int h = bufferedImage.getHeight();
BufferedImage bufim = new BufferedImage(w, h, bufferedImage.getType());
Graphics2D g = bufim.createGraphics();
g.drawImage(bufferedImage, 0, 0, w, h, w, 0, 0, h, null);
g.dispose();
return bufim;
}
}