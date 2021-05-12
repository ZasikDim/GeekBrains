import UIKit

// 1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.

enum GameStoreErrors: Error {
    case notEnoughtMoney
    case gameNotFound
    case sellOff
}

struct Game {
    let name: String
    var price: Int
    var count: Int
}
class GameStore {
    
    var games = [
        "Sims4": Game(name: "Sims4", price: 2000, count: 2),
        "Cyberpunk": Game(name: "Cyberpunk 2077", price: 2700, count: 5)
        ]
    var moneyDeposit = 0
    func giveMoney(money: Int) -> Int {
        moneyDeposit += money
        return moneyDeposit
    }
    
    func buy (name: String) throws {
        guard var game = games[name] else {
            throw GameStoreErrors.gameNotFound
        }
        guard game.count > 0 else {
            throw GameStoreErrors.sellOff
        }
        guard game.price <= moneyDeposit else {
            throw GameStoreErrors.notEnoughtMoney
        }
        game.count -= 1
        print("Куплена игра: \(game.name), Ваша сдача: \(moneyDeposit - game.price)")
        moneyDeposit = 0
        games[name] = game
    }
}

func buyGame(gameName: String, gameStore: GameStore) throws {
    try gameStore.buy(name: gameName)
}

var gamestor = GameStore()
gamestor.giveMoney(money: 3100)

try buyGame(gameName: "Sims4", gameStore: gamestor)

do {
    try buyGame(gameName: "Sims4", gameStore: gamestor)
} catch GameStoreErrors.gameNotFound {
    print("Игра не найдена")
} catch GameStoreErrors.notEnoughtMoney {
    print("Недостаточно денег")
} catch GameStoreErrors.sellOff {
    print("Игра распродана")
}

do {
    try buyGame(gameName: "Sims5", gameStore: gamestor)
} catch GameStoreErrors.gameNotFound {
    print("Игра не найдена")
} catch GameStoreErrors.notEnoughtMoney {
    print("Недостаточно денег")
} catch GameStoreErrors.sellOff {
    print("Игра распродана")
}
