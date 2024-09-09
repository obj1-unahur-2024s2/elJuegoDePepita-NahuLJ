import comidas.*
import pepita.*
import wollok.game.*

object nido {
	var property position = game.at(8,6) 
	
	method image() = "nido.png"
	
}

object silvestre {
	var property position = game.at(3,0) 
	
	method image() = "silvestre.png" 

	method siguiente() = manzana

	method estaEnBorde()= position.x() < 3
}

