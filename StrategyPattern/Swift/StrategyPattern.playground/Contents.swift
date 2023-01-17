import Foundation

protocol QuackingStrategy {
    func execute()
}

protocol FlyingStrategy {
    func execute()
}

class DefaultQuakingStrategy: QuackingStrategy {
    func execute() {
        print("Quak")
    }
}

class DefaultFlyingStrategy: FlyingStrategy {
    func execute() {
        print("Fly")
    }
}

class NoFlyingStrategy: FlyingStrategy {
    func execute() {
        print("Sorry I can not fly")
    }
}

class Duck {
    private let quakingStrategy: QuackingStrategy
    private let flyingStrategy: FlyingStrategy

    init(quakingStrategy: QuackingStrategy, flyingStrategy: FlyingStrategy) {
        self.quakingStrategy = quakingStrategy
        self.flyingStrategy = flyingStrategy
    }

    func quak() {
        quakingStrategy.execute()
    }

    func fly() {
        flyingStrategy.execute()
    }
}

let normalDuck = Duck(quakingStrategy: DefaultQuakingStrategy(), flyingStrategy: DefaultFlyingStrategy())
print("Normal duck")
normalDuck.quak()
normalDuck.fly()

let rubberDuck = Duck(quakingStrategy: DefaultQuakingStrategy(), flyingStrategy: NoFlyingStrategy())
print("\nRubber duck")
rubberDuck.quak()
rubberDuck.fly()
