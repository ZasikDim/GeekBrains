import UIKit

// 1.Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
// 2. Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
// 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
// 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
// 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
// 6. Вывести значения свойств экземпляров в консоль.


enum Transmission {
    case manual, auto
}
enum Gas {
    case off, on
}
enum Windows {
    case open, close
}
enum Roof {
    case open, close
}
enum Cargo {
    case load, unload
}
enum Light {
    case off, on
}
enum CityCenterParking {
    case on, off
}
enum AlarmSystem {
    case off, on
}
class Car {
    var carName: String
    var year: UInt
    let transmission: Transmission
    var gas: Gas
    var windows: Windows
    var km: Double
    var light: Light
    var parking: CityCenterParking
    var alarm: AlarmSystem
    
    init(carName: String, year: UInt, transmission: Transmission, gas: Gas, windows: Windows, km: Double, light: Light, parking: CityCenterParking, alarm: AlarmSystem) {
        self.carName = carName
        self.year = year
        self.transmission = transmission
        self.gas = gas
        self.windows = windows
        self.km = km
        self.light = light
        self.parking = parking
        self.alarm = alarm
    }
    func gasOn() {
        gas = .on
        print("В \(carName) включили двигатель")
    }
    func gasOff() {
        gas = .off
        print("В \(carName) выключили двигатель")
    }
    func openWindows() {
        windows = .open
        print("В \(carName) открыли окна")
    }
    func closeWindows() {
        windows = .close
        print("В \(carName) закрыли окна")
    }
    func lightOn() {
        light = .on
        print("В \(carName) включили фары")
    }
    func lightOff() {
        if (gas == .off) {
            light = .off
            print("В \(carName) выключили фары")
        } else {
            print("Нельзя выключать фары во время движения")
        }
    }
    func parkinOn() {
        parking = .on
        print("\(carName) припарковался")
    }
    func parkingOff() {
        parking = .off
        print("\(carName) покинул парковку")
    }
    func alarmOn() {
        alarm = .on
        print("В \(carName) включили сигнализацию")
    }
    func alarmOff() {
        parking = .off
        print("В \(carName) выключили сигнализацию")
    }
}
class SportCar: Car {
    var roof: Roof
    init(carName: String, year: UInt, transmission: Transmission, gas: Gas, windows: Windows, km: Double, light: Light, parking: CityCenterParking, alarm: AlarmSystem, roof: Roof) {
        self.roof = roof
        super.init(carName: carName, year: year, transmission: transmission, gas: gas, windows: windows, km: km, light: light, parking: parking, alarm: alarm)
    }
    func openRoof() {
        roof = .open
        print("В \(carName) открыли крышу")
    }
    func closeRoof() {
        roof = .close
        print("В \(carName) закрыли крышу")
    }
    override func alarmOff() {
        print("В \(carName) нет возможности выключили сигнализацию")
    }
}
class TruckCar: Car {
    let capacity: UInt
    var occupiedSpace: UInt
    var cargo: Cargo
    init(carName: String, year: UInt, transmission: Transmission, gas: Gas, windows: Windows, km: Double, light: Light, parking: CityCenterParking, alarm: AlarmSystem, capacity: UInt, occupiedSpace: UInt, cargo: Cargo) {
        self.capacity = capacity
        self.occupiedSpace = occupiedSpace
        self.cargo = cargo
        super.init(carName: carName, year: year, transmission: transmission, gas: gas, windows: windows, km: km, light: light, parking: parking, alarm: alarm)
    }
    override func parkinOn() {
        print("Парковка для грузовиков в центре запрещена")
    }
    func load(a: UInt) -> UInt {
        if (occupiedSpace + a) > capacity {
            print("В \(carName) недостаточно места")
        } else {
        occupiedSpace += a
        print("В \(carName) загрузили \(a) коробки, места осталось для \(capacity - occupiedSpace) коробок")
        }
        return occupiedSpace
    }
    func unload(a: UInt) -> UInt {
        if a > occupiedSpace {
            print("В \(carName) нет столько коробок")
        } else {
            occupiedSpace -= a
            print("Из \(carName) выгрузили \(a) коробок, места осталось для \(capacity - occupiedSpace) коробок")
        }
        return occupiedSpace
    }
    
}

var sportCar1 = SportCar(carName: "Mersedes", year: 2020, transmission: .manual, gas: .off, windows: .close, km: 3000, light: .off, parking: .off, alarm: .on, roof: .close)
var sportCar2 = SportCar(carName: "Bmw", year: 2017, transmission: .auto, gas: .off, windows: .open, km: 700000, light: .off, parking: .off, alarm: .on, roof: .close)
var truck1 = TruckCar(carName: "КамАЗ", year: 2010, transmission: .manual, gas: .off, windows: .close, km: 99000, light: .off, parking: .off, alarm: .off , capacity: 140, occupiedSpace: 100, cargo: .load)
var truck2 = TruckCar(carName: "ЗИЛ", year: 2007, transmission: .manual, gas: .on, windows: .open, km: 120000, light: .on, parking: .off, alarm: .off, capacity: 70, occupiedSpace: 20, cargo: .unload)

sportCar1.gasOn()
sportCar1.lightOff()
sportCar1.parkinOn()
sportCar1.gasOff()
sportCar1.lightOff()
sportCar1.km = 3005.6
print("Пробег машины \(sportCar1.carName) \(sportCar1.km) км.")
print("========")

sportCar2.openRoof()
sportCar2.closeWindows()
sportCar2.alarmOff()
sportCar2.alarm
print("========")

truck1.openWindows()
truck1.gasOn()
truck1.parkinOn()
truck1.parking
truck1.load(a: 10)
truck1.load(a: 40)
print("========")

truck2.unload(a: 10)
truck2.unload(a: 15)
truck2.alarmOn()

