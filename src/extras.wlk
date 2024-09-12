import comidas.*
import pepita.*
import wollok.game.*

object nido {
	var property position = game.at(8,6) 
	
	method image() = "nido.png"

	method interactuar(){
		pepita.ganar()
		game.removeTickEvent("gravedad")
	}
	
}

object silvestre { 
	
	method image() = "silvestre.png" 

	method position() = game.at(pepita.position().x().max(3), 0)

	method interactuar(){
		pepita.perder()
		game.removeTickEvent("gravedad")
	}

}

