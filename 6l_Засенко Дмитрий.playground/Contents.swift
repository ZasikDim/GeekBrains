import UIKit

// 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
// 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
// 3. *Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

enum Rating {
    case one, two, three, four, five
}
enum MusicGenre {
    case rock, pop, hihHop
}

protocol MusicTrack {
    var singer: String {get}
    var song: String {get}
    var year: UInt {get}
    var genre: MusicGenre {get}
    var rating: Rating {get set}
}
class RussianMusic: MusicTrack, CustomStringConvertible {
    var description: String {
        "\(singer) - \(song), \(year)."
    }
    let singer: String
    let song: String
    let year: UInt
    let genre: MusicGenre
    var rating: Rating
    init(singer: String, song: String, year: UInt, genre: MusicGenre, rating: Rating) {
        self.singer = singer
        self.song = song
        self.year = year
        self.genre = genre
        self.rating = rating
    }
}
class EnglishMusic: MusicTrack, CustomStringConvertible {
    var description: String {
        "\(singer) - \(song), \(year)."
    }
    let singer: String
    let song: String
    let year: UInt
    let genre: MusicGenre
    var rating: Rating
    init(singer: String, song: String, year: UInt, genre: MusicGenre, rating: Rating) {
        self.singer = singer
        self.song = song
        self.year = year
        self.genre = genre
        self.rating = rating
    }
}

struct Stack<T> {
    var playList = [T]()
    mutating func push(_ element: T) {
        playList.append(element)
  /*      if playList.count > 5 {
            playList.removeFirst()
        }
         */
    }
    mutating func remove() -> T? {
        return playList.removeFirst()
    }
    
    func filter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in playList {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
    
    
}


var ruTrack1 = RussianMusic(singer: "Наташа Королева", song: "Желтые тюльпаны", year: 2002, genre: .pop, rating: .three)
var ruTrack2 = RussianMusic(singer: "Филипп Киркоров ", song: "Цвет настроения синий", year: 2018, genre: .pop, rating: .five)
var ruTrack3 = RussianMusic(singer: "Би-2", song: "Серебро", year: 2000, genre: .rock, rating: .five)
var ruTrack4 = RussianMusic(singer: "Тимати", song: "Баклажан", year: 2016, genre: .hihHop, rating: .three)
var ruTrack5 = RussianMusic(singer: "Элджей", song: "Розовое вино", year: 2017, genre: .hihHop, rating: .four)
var ruTrack6 = RussianMusic(singer: "Земфира", song: "Ариведерчи", year: 1999, genre: .rock, rating: .five)


var enTrack1 = EnglishMusic(singer: "The Weeknd", song: "I Was Never There", year: 2018, genre: .pop, rating: .five)
var enTrack2 = EnglishMusic(singer: "Miley Cyrus", song: "Wrecking Ball", year: 2013, genre: .pop, rating: .four)
var enTrack3 = EnglishMusic(singer: "Dua Lipa", song: "One kiss", year: 2018, genre: .pop, rating: .five)
var enTrack4 = EnglishMusic(singer: "Sting", song: "Englishman in New York", year: 1987, genre: .pop, rating: .five)
var enTrack5 = EnglishMusic(singer: "Jennifer Lopez", song: "I'm Gonna Be Alright", year: 2001, genre: .pop, rating: .three)
var enTrack6 = EnglishMusic(singer: "50 cent", song: "In Da Club", year: 2003, genre: .hihHop, rating: .four)

var rusMusic = Stack<RussianMusic>()
var enMusic = Stack<EnglishMusic>()

rusMusic.push(ruTrack1)
rusMusic.push(ruTrack2)
rusMusic.push(ruTrack3)
rusMusic.push(ruTrack4)
rusMusic.push(ruTrack5)
print(rusMusic.playList)
print("-----")

rusMusic.push(ruTrack6)
print(rusMusic.playList)
print("-----")
//musicOfNineties.push(track6)
rusMusic.playList

print(rusMusic.filter(predicate: {$0.rating == .five}))
print("-----")

print(rusMusic.filter(predicate: {$0.genre == .rock}))

print("-----")
enMusic.push(enTrack1)
enMusic.push(enTrack2)
enMusic.push(enTrack3)
enMusic.push(enTrack4)
enMusic.push(enTrack5)
print(enMusic.playList)
print("-----")

enMusic.remove()
enMusic.push(enTrack6)
print(enMusic.playList)
print("-----")

print(enMusic.filter(predicate: {$0.rating == .five}))
var playListTest = enMusic.playList
