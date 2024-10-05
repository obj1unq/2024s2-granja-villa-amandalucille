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
        self.plantarEnLaCeldaDeArribaSiPuede()
    }
    method plantarEnLaCeldaDeArribaSiPuede(){
        const posicionAlSerRegado = (game.at(position.x(), position.y() + 1))
        const tomaco = new Tomaco(position = posicionAlSerRegado)

        if (position.y() < game.height() - 1){
            game.removeVisual(position)
            game.addVisual(tomaco)
        }
    }
	
	method esPlanta(){
		return true
	}
}