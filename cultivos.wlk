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

    method regar() {
        //
    }
	
	method esPlanta(){
		return true
	}
}
class Tomaco {
    var property position
    var property image = "tomaco.png"

    method regar() {
        //
    }
	
	method esPlanta(){
		return true
	}
}