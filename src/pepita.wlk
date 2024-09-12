import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(0,2)

	method image() {
		return "pepita" + self.nombreEstadoEnergia() + ".png" 
	}

	method nombreEstadoEnergia(){
		return if (self.estaCansada()) "-gris" else "" 
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
		game.say(self, "AHHH SIENTO EL PODER!!. Ahora tengo " + energia + " de energia")
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if (not self.estaCansada()){
			self.vola(position.distance(nuevaPosicion))
			position = nuevaPosicion
			game.say(self, "Tengo " + 0.max(self.energia()) + " de energia restante")
		}
		else{
			game.stop()
			game.say(self, "ME HICISTE PERDER PELOTUDO")
		}
		
	}

	method estaCansada() {
		
		return energia <= 0
	}

	method estaEnElNido() = self.position() == nido.position()
	

	method estaAtrapada() = self.position() == silvestre.position()

	method bajar(){
		position = game.at(position.x(), 0.max(position.y() - 1))
	}

}

