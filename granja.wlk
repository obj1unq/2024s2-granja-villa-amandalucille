import wollok.game.*
import cultivos.*
import hector.*

object granja {
    const property sembrado = #{}

   method verificarEspacioEnParcela(position){
		if  ((sembrado.find({elem => elem.position(position)}))){
			self.error("Esta parcela esta ocupada")
		}
	}

    method verificarSiHayPlanta(position){
		if (not (game.colliders(self).any({ elem => elem.esPlanta() }))){
			self.error("No tengo nada para regar")
		}
	}
}