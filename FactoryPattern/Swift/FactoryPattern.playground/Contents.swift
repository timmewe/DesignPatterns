protocol Shape {
    func draw()
}

class Rectangle: Shape {
    func draw() {
        print("Rectangle")
    }
}

class Circle: Shape {
    func draw() {
        print("Circle")
    }
}

protocol ShapeFactory {
    func createShape() -> Shape
}

class RandomShapeFactory: ShapeFactory {
    func createShape() -> Shape {
        let random = Int.random(in: 1...2)
        switch random {
            case 1:
                return Rectangle()
            default:
                return Circle()
        }
    }
}

class CircleBiasedShapeFactory: ShapeFactory {
    func createShape() -> Shape {
        let random = Int.random(in: 1...3)
        switch random {
            case 1:
                return Rectangle()
            default:
                return Circle()
        }
    }
}

class Canvas {
    let shapeFactory: ShapeFactory

    init(shapeFactory: ShapeFactory) {
        self.shapeFactory = shapeFactory
    }

    func drawShapes() {
        for _ in 1...10 {
            let shape = shapeFactory.createShape()
            shape.draw()
        }
    }
}

print("Random factory")
let randomCanvas = Canvas(shapeFactory: RandomShapeFactory())
randomCanvas.drawShapes()

print("\nCircle biased factory")
let circleBiasedCanvas = Canvas(shapeFactory: CircleBiasedShapeFactory())
circleBiasedCanvas.drawShapes()
