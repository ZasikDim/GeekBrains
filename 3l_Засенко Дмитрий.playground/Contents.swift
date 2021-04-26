import UIKit

// 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
// 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
// 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
// 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
// 6. Вывести значения свойств экземпляров в консоль.

 struct SportCar {
    let brand: String
    let howOld: UInt
    
    var stateOfEngine: Motor
    mutating func gasOn() {
        stateOfEngine = .on
        print("В \(brand) Мотор включен")
    }
    mutating func gasOff() {
        stateOfEngine = .off
        print("В \(brand) Мотор выключен")
    }
    
    var action: Action
    let capacity: UInt
    var occupiedSpace: UInt
    mutating func load(a: UInt) -> UInt{
        occupiedSpace += a
        print("В \(brand) загрузили \(a) коробки, места осталось для \(capacity - occupiedSpace) коробок")
        return occupiedSpace
    }
    mutating func unload(a: UInt) -> UInt{
        occupiedSpace -= a
        print("Из \(brand) выгрузили \(a) коробок, места осталось для \(capacity - occupiedSpace) коробок")
        return occupiedSpace
    }
    
    var stateOfWindows: Windows
    mutating func openTheWindows() {
        stateOfWindows = .open
        print("В \(brand) окна открыты")
    }
    mutating func closeTheWindows() {
        stateOfWindows = .close
        print("В \(brand) окна закрыты")
    }
    
}

struct TrunkCar {
    let brand: String
    let howOld: UInt
    var stateOfEngine: Motor
    mutating func gasOn() {
        stateOfEngine = .on
        print("В \(brand) Мотор включен")
    }
    mutating func gasOff() {
        stateOfEngine = .off
        print("В \(brand) Мотор выключен")
    }
    
    var action: Action
    let capacity: UInt
    var occupiedSpace: UInt
    mutating func load(a: UInt) -> UInt{
        occupiedSpace += a
        if occupiedSpace > capacity {
            print("Недостаточно места")
        } else {
            print("В \(brand) загрузили \(a) коробки, места осталось для \(capacity - occupiedSpace) коробок")
        }
        return occupiedSpace
    }
    mutating func unload(a: UInt) -> UInt{
        occupiedSpace -= a
        print("Из \(brand) выгрузили \(a) коробок, места осталось для \(capacity - occupiedSpace) коробок")
        return occupiedSpace
    }
    
    var stateOfWindows: Windows
    mutating func openTheWindows() {
        stateOfWindows = .open
        print("В \(brand) окна открыты")
    }
    mutating func closeTheWindows() {
        stateOfWindows = .close
        print("В \(brand) окна закрыты")
    }
    
    
}

enum Motor {
    case on
    case off
}
enum Windows {
    case open
    case close
}
enum Action{
    case load
    case unload
    
}

var trunk1 = TrunkCar(brand: "Bmw Truck", howOld: 2018, stateOfEngine: .off, action: .load, capacity: 50, occupiedSpace: 0, stateOfWindows: .close)
trunk1.load(a: 20)
trunk1.occupiedSpace
trunk1.unload(a: 5)
trunk1.occupiedSpace
trunk1.openTheWindows()
trunk1.stateOfWindows
trunk1.closeTheWindows()
trunk1.stateOfWindows
trunk1.gasOn()
trunk1.stateOfEngine
trunk1.stateOfEngine = .off
trunk1.stateOfEngine


var trunk2 = TrunkCar(brand: "Mersedes Truck", howOld: 2015, stateOfEngine: .off, action: .unload, capacity: 60, occupiedSpace: 50, stateOfWindows: .open)
trunk2.unload(a: 43)
trunk2.occupiedSpace
trunk2.stateOfWindows
trunk2.closeTheWindows()
trunk2.stateOfWindows
trunk2.gasOn()
trunk2.stateOfEngine

var car1 = SportCar(brand: "Mazda", howOld: 2020, stateOfEngine: .on, action: .unload, capacity: 5, occupiedSpace: 3, stateOfWindows: .open)
car1.closeTheWindows()
car1.stateOfWindows
car1.gasOff()
car1.unload(a: 3)
car1.action = .load
car1.action
 
