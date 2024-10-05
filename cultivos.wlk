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
       method verificarSiEstaListaParaCosecha(){
        if(not (self.esPlantaListaParaCosecha())){
			self.error("La planta no está lista para cosecha")
		}
    }
    method esPlantaListaParaCosecha(){
        return image != "corn_baby.png"
    }
    method costoPorUnidad(){
        return 150
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
       method verificarSiEstaListaParaCosecha(){
        if(not (self.esPlantaListaParaCosecha())){
			self.error("La planta no está lista para cosecha")
		}
    }
    method esPlantaListaParaCosecha(){
        return etapa >= 2
    }
    method costoPorUnidad(){
        return (etapa - 1) * 100
    }
}
class Tomaco {
    var property position
    var property image = "tomaco.png"

    method esPlanta(){
		return true
	}

    method regar() {
        self.plantarArribaSiPuede()
    }
    method plantarArribaSiPuede(){
        if (position.y() < game.height() - 1){
            const posicionAlSerRegado = (game.at(position.x(), position.y() + 1))
                self.plantarArriba(posicionAlSerRegado)            
        }
    }
    method plantarArriba(nuevaPosicion){
                const tomaco = new Tomaco(position = nuevaPosicion)
                game.addVisual(tomaco)
        }
    method verificarSiEstaListaParaCosecha(){
        if(not (self.esPlantaListaParaCosecha())){
			self.error("La planta no está lista para cosecha")
		}
    }
    method esPlantaListaParaCosecha(){
        return true
    }
    method costoPorUnidad(){
        return 80
    }
}