import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(0,2)

	method image() {
		return "pepita" + self.nombreFotoSegunEstado() + ".png" 
	}

	method nombreFotoSegunEstado(){
		return if (not self.estaViva()) "-gris" else if (self.estaEnElNido()) "-grande" else ""
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
		//game.say(self, "AHHH SIENTO EL PODER!!. Ahora tengo " + energia + " de energia")
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if (self.puedeMoverse()){
			self.vola(position.distance(nuevaPosicion))
			position = nuevaPosicion
			//game.say(self, "Tengo " + 0.max(self.energia()) + " de energia restante")
		}
		else{
			self.perder()
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

	method ganar(){
		game.removeTickEvent("gravedad")
		game.say(self, "GANE!!")
		game.schedule(2000, {=> game.stop()})
	}

	method perder(){
		game.removeTickEvent("gravedad")
		game.say(self, "PERDI!!")
		game.schedule(2000, {=> game.stop()})
		
	}

	method puedeMoverse() = self.estaViva() and not self.estaEnElNido()

	method estaViva() = not self.estaCansada() and not self.estaAtrapada()

}

