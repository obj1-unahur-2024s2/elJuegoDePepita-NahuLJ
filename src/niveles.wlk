import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		game.addVisual(manzana)
		game.addVisual(alpiste)
		config.iniciar()
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
	}

}

object config {

	method configurarTeclas() {
		
		keyboard.left().onPressDo({ 
			if (0 < pepita.position().x())
				pepita.irA(pepita.position().left(1))})
		keyboard.right().onPressDo({ 
			if (game.width()-1 > pepita.position().x())
				pepita.irA(pepita.position().right(1))})
		keyboard.down().onPressDo({ 
			if (0 < pepita.position().y())
				pepita.irA(pepita.position().down(1))})
		keyboard.up().onPressDo({ 
			if (game.height()-1 > pepita.position().y())
				pepita.irA(pepita.position().up(1))})
		
		keyboard.c().onPressDo({ pepita.come(game.uniqueCollider(pepita))})
	}

	method configurarColisiones() {
		game.onCollideDo(pepita, { comida => pepita.come(comida)})
	}

	method configurarGravedad() {
		game.onTick(800, "gravedad",{ => pepita.bajar()})
	}

	method iniciar(){
		self.configurarTeclas()
		self.configurarGravedad()
	}

}


