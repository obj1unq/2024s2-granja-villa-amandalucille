import wollok.game.*

class Maiz {
    var property position
    var property image = "corn_baby.png"

    method regar() {
        self.image("corn_adult.png")
    }
}