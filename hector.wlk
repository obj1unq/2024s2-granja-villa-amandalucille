import wollok.game.*
import cultivos.*

object hector {
	var property position = game.center()
	const property image = "player.png"

	method irHaciaLaIzq(){
		position = game.at(0.max(position.x() - 1), position.y()) // position.x() obtiene la coordenada x actual de la posición de Héctor y position.y() la coordenada y actual de Hector.
																	// 0.max  se asegura de que la nueva coordenada x no sea menor que 0, es decir, evita que Héctor salga del límite izquierdo del tablero. Si position.x() - 1 es menor que 0, 0.max(...) devolverá 0.
	}

	method irHaciaLaDer(){
		position = game.at((position.x() + 1).min((game.width() - 1)), position.y())
	}

	method irHaciaArriba(){
		position = game.at(position.x(), (position.y() + 1).min(game.width() - 1))
	}

	method irHaciaAbajo(){
		position = game.at(position.x(), (0).max(position.y() - 1))
	}

	method sembrarMaiz(){
		self.verificarSiPuedeSembrar()
			game.addVisual(new Maiz(position = position) )
	}
	method sembrarTrigo(){

	}
	method sembrarTomacco(){
	
	}
	method verificarSiPuedeSembrar(){
		if  (game.colliders(self) > 0){
			self.error("Esta parcela esta ocupada")
		}
	}
}