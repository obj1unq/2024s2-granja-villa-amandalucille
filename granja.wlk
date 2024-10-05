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
		if  ((sembrado.find({elem => elem.position(position)}))){
			hector.error("No hay planta en esta parcela")
		}
	}
}