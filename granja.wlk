import wollok.game.*
import cultivos.*
import hector.*

object granja {
    const property sembrado = #{}

   method verificarEspacioEnParcela(posicion){
		if(sembrado.any({elem => elem.position() == posicion})){
			hector.error("Esta parcela está ocupada")
		}
	}

    method verificarSiHayPlanta(position){
		if  (not (game.getObjectsIn(position).any({obj => obj.esPlanta()}))){
			hector.error("No tengo nada para regar")
		}
	}
}