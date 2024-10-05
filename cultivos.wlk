import wollok.game.*

class Maiz {
    var property position 
    var property image = "corn_baby.png"

    method regar() {
        self.image("corn_adult.png")
	}
    method esPlanta(){
		return true
	}
}
class Trigo {
    var property position
    var property image = "wheat_0.png"
    var property etapa = 0

    method regar() {
         etapa = (etapa + 1) % 4 
         image = "wheat_" + etapa + ".png"
    }
	method esPlanta(){
		return true
	}

}
class Tomaco {
    var property position
    var property image = "tomaco.png"

    method regar() {
        self.plantarArribaSiPuede()
    }
    method plantarArribaSiPuede(){
        if (position.y() < game.height() - 1){
            const posicionAlSerRegado = (game.at(position.x(), position.y() + 1))
                game.removeVisual(position)
                self.plantarArriba(posicionAlSerRegado)            
        }
    }
    method plantarArriba(nuevaPosicion){
                const tomaco = new Tomaco(position = nuevaPosicion)
                game.addVisual(tomaco)
        }
        
	
	method esPlanta(){
		return true
	}
}