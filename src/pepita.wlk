import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(0,2)
	var property seguidor = silvestre

	method image() {
		return 
				if (self.estaEnElNido()) "pepita-grande.png" 
				else if (self.estaAtrapada()) "pepita-gris.png" 
				else "pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
		if (self.position().x() >= 3)seguidor.position(game.at(position.x(), seguidor.position().y()))
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() = self.position() == nido.position()
	

	method estaAtrapada() = self.position() == silvestre.position()



}

