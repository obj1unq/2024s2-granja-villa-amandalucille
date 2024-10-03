import wollok.game.*

class Maiz {
    var property position
    var property image = "corn_baby.png"
	var property estado 

    method regar() {
        self.image("corn_adult.png")
    }
}
class Trigo {
    var property position
    var property image = "wheat_0.png"

    method regar() {
        //
    }
}
class Tomaco {
    var property position
    var property image = "tomaco.png"

    method regar() {
        //
    }
}