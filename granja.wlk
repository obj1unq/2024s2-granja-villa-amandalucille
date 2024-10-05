import wollok.game.*
import cultivos.*
import hector.*

object granja {
    const property sembrado  = #{}

   method verificarEspacioEnParcela(posicion){
		if(sembrado.any({elem => elem.position() == posicion})){
			hector.error("Esta parcela está ocupada")
		}
	}

    method verificarSiHayPlanta(posicion){
		
		const elementosEnPosicionActual = game.getObjectsIn(posicion)

		if  (elementosEnPosicionActual.filter({obj => obj.esPlanta()}).isEmpty()){
			hector.error("No hay planta")
		}
	}
	
}
	