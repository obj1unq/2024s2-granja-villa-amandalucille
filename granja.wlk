import wollok.game.*
import cultivos.*
import hector.*

object granja {
    const property sembrado = #{}

   method verificarEspacioEnParcela(posicion){
		if(sembrado.any({elem => elem.position() == posicion})){
			self.error("Esta parcela esta ocupada")
			game.say(self, "Esta parcela esta ocupada")
		}
	}

    method verificarSiHayPlanta(position){
		if  ((sembrado.find({elem => elem.position(position)}))){
			self.error("No hay planta en esta parcela")
		}
	}
}