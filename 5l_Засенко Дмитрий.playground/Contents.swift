import UIKit

// 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
// 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
// 3. Создать два класса, имплементирующих протокол «Car»: tunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
// 4. Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
// 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
// 6. Вывести сами объекты в консоль.

enum TicketsStatus {
    case with, without
}
enum HotelStatus {
    case with, without
}
enum ExcursionStatus {
    case with, without
}
enum BoatTripStatus {
    case with, without
}
enum MealStatus {
    case bb, hb, all
}

protocol Trip {
    var country: String {get}
    var tickets: TicketsStatus {get set}
    var hotel: HotelStatus {get set}
}

extension Trip {
    mutating func buyTickets (tickets: TicketsStatus) -> TicketsStatus {
        switch tickets {
        case .with:
            self.tickets = .with
            print("Trip to \(country) \(tickets) fly tickets.")
            return self.tickets
        case .without:
            self.tickets = .without
            print("Trip to \(country) \(tickets) fly tickets.")
            return self.tickets
        }
    }
}

extension Trip {
    mutating func orderHotel (hotel: HotelStatus) -> HotelStatus {
        switch hotel {
        case .with:
            self.hotel = .with
            print("Trip to \(country) \(hotel) hotel.")
            return self.hotel
        case .without:
            self.hotel = .without
            print("Trip to \(country) \(hotel) hotel.")
            return self.hotel
        }
    }
}

class CityTrip: Trip, CustomStringConvertible {
    var country: String
    var tickets: TicketsStatus
    var hotel: HotelStatus
    var excursion: ExcursionStatus
    var description: String {
        "We are going to \(country) \(tickets) fly tickets, \(hotel) hotel, \(excursion) excursions."
    }
    init(country: String, tickets: TicketsStatus, hotel: HotelStatus, excursion: ExcursionStatus) {
        self.country = country
        self.tickets = tickets
        self.hotel = hotel
        self.excursion = excursion
        print("We bought city trip to \(country).")
    }
}
extension CityTrip {
    func orderExcursion (excursion: ExcursionStatus) -> ExcursionStatus {
        switch excursion {
        case .with:
            self.excursion = .with
            print("Trip to \(country) \(excursion) excursions.")
            return self.excursion
        case .without:
            self.excursion = .without
            print("Trip to \(country) \(excursion) excursions.")
            return self.excursion
        }
    }
}

class IslandTrip: Trip, CustomStringConvertible{
    var country: String
    var tickets: TicketsStatus
    var hotel: HotelStatus
    var meal: MealStatus
    var boatTrip: BoatTripStatus
    init(country: String, tickets: TicketsStatus, hotel: HotelStatus, meal: MealStatus, boatTrip: BoatTripStatus) {
        self.country = country
        self.tickets = tickets
        self.hotel = hotel
        self.meal = meal
        self.boatTrip = boatTrip
        print("We bought island trip to \(country).")
    }
    var description: String {
        "We are going to \(country) \(tickets) fly tickets, \(hotel) hotel, meal plan: \(meal), \(boatTrip) boatTrip."
    }
}
extension IslandTrip {
    func orderMeal (meal: MealStatus) -> MealStatus {
        switch meal {
        case .bb:
            self.meal = .bb
            print("Trip to \(country), meal plan: \(meal).")
            return meal
        case .hb:
            self.meal = .hb
            print("Trip to \(country), meal plan: \(meal).")
            return meal
        case .all:
            self.meal = .all
            print("Trip to \(country), meal plan: \(meal).")
            return meal
        }
    }
    func orderBoatTrip (boatTrip: BoatTripStatus) -> BoatTripStatus {
        switch boatTrip {
        case .with:
            self.boatTrip = .with
            print("Trip to \(country), \(boatTrip) boat trip.")
            return boatTrip
        case .without:
            self.boatTrip = .with
            print("Trip to \(country), \(boatTrip) boat trip.")
            return boatTrip
        }
    }
}

var trip1 = CityTrip(country: "France", tickets: .with, hotel: .with, excursion: .without)
var trip2 = CityTrip(country: "India", tickets: .without, hotel: .without, excursion: .without)
var trip3 = IslandTrip(country: "Cuba", tickets: .without, hotel: .without, meal: .hb, boatTrip: .without)
var trip4 = IslandTrip(country: "Hawaii", tickets: .with, hotel: .with, meal: .bb, boatTrip: .with)
print("======")

print(trip1)
trip1.orderExcursion(excursion: .with)
trip1.orderHotel(hotel: .without)
print(trip1)
print("======")

print(trip2)
trip2.buyTickets(tickets: .with)
trip2.orderHotel(hotel: .with)
trip2.orderExcursion(excursion: .with)
print(trip2)
print("======")

print(trip3)
trip3.buyTickets(tickets: .with)
trip3.orderHotel(hotel: .with)
trip3.orderMeal(meal: .all)
trip3.orderBoatTrip(boatTrip: .with)
print(trip3)
print("======")

print(trip3)
trip4.orderMeal(meal: .hb)
print(trip4)
