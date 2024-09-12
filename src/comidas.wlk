import extras.*
import wollok.game.*

object manzana {
	

	method image() = "manzana.png"

	method position() = game.at(5, 5) 

	method energiaQueOtorga() = 50

}

object alpiste {

	method image() = "alpiste.png"

	method position() = game.at(5, 9)

	method energiaQueOtorga() = 80
}

