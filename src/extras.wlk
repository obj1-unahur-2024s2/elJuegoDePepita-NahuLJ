import comidas.*
import pepita.*
import wollok.game.*

object nido {
	var property position = game.at(8,6) 
	
	method image() = "nido.png"
	
}

object silvestre { 
	
	method image() = "silvestre.png" 

	method position() = game.at(pepita.position().x().max(3), 0)

}

