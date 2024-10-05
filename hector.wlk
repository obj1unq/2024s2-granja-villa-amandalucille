import wollok.game.*
import cultivos.*
import granja.*

object hector {
	var property position    = game.center()
	const property image     = "player.png"
	const property stock     = #{}
	var property ganancias = 0

	method irHaciaLaIzq(){
		position = game.at(0.max(position.x() - 1), position.y()) // position.x() obtiene la coordenada x actual de la posición de Héctor y position.y() la coordenada y actual de Hector.
																	// 0.max  se asegura de que la nueva coordenada x no sea menor que 0, es decir, evita que Héctor salga del límite izquierdo del tablero. Si position.x() - 1 es menor que 0, 0.max(...) devolverá 0.
	}

	method irHaciaLaDer(){
		position = game.at((position.x() + 1).min((game.width() - 1)), position.y())
	}

	method irHaciaArriba(){
		position = game.at(position.x(), (position.y() + 1).min(game.height() - 1))
	}

	method irHaciaAbajo(){
		position = game.at(position.x(), (0).max(position.y() - 1))
	}

	method esPlanta(){
		return false
	}

	method sembrarMaiz(){
		const maiz = new Maiz(position = self.position())
		
		granja.verificarEspacioEnParcela(self.position())
			game.addVisual(maiz)
			granja.sembrado().add(maiz)
	}
	method sembrarTrigo(){
		const trigo = new Trigo(position = self.position())

		granja.verificarEspacioEnParcela(self.position())
			game.addVisual(trigo)
			granja.sembrado().add(trigo)
	}
	method sembrarTomaco(){
		const tomaco = new Tomaco(position = self.position())

		granja.verificarEspacioEnParcela(self.position())
			game.addVisual(tomaco)
			granja.sembrado().add(tomaco)

	}
	
	method regarParcelaSiPuede(){
		granja.verificarSiHayPlanta(self.position())
		self.regarPlanta()
	}
	method regarPlanta(){
		const plantaEnParcela = (self.position().allElements()).find({obj => obj.esPlanta()})
		plantaEnParcela.regar()
	}
	method cosecharParcelaSiPuede(){
		granja.verificarSiHayPlanta(self.position())
		self.cosecharPlantaSiPuede()
	}
	method cosecharPlantaSiPuede(){
		const plantaEnParcela = (self.position().allElements()).find({obj => obj.esPlanta()})
		
		plantaEnParcela.verificarSiEstaListaParaCosecha()
		self.stock().add(plantaEnParcela)
		game.removeVisual(plantaEnParcela)
		}
	method venderStock(){
			stock.forEach({cosecha => ganancias = ganancias + cosecha.costoPorUnidad()})
			stock.clear()
		}
	method mostrarEstadoDeStockYVentas(){
		game.say(self, "tengo" + " " + ganancias + " " + "monedas" + " " + "y" + " " + stock.size() + " " + "plantas" + " " + "para vender")
		}
	}
