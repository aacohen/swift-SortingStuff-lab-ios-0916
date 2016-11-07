//
//  SortingStuff.swift
//  ClosuresAreGreat
//
//  Created by Ron Don Volante on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


struct ToyBin {
    
    var ships: [Ship] = []
    var books: [Book] = []
    var bowlingPins: [BowlingPin] = []
    var musicCDs: [MusicCD] = []
    
    // TODO: Implement all of the sort functions (lets organize this toy bin!)
    
    mutating func sortShips() {
        let sortedShips = ships.sorted { (ship1, ship2) -> Bool in
            return ship1.age > ship2.age
        }
        self.ships = sortedShips
        
    }
    
    mutating func sortBooks() {
        
        books = books.sorted {$0.name < $1.name}
    
    }
    
    mutating func sortBowlingPins() {
        let sortedBowlingPins = bowlingPins.sorted { $0.color.rawValue < $1.color.rawValue }
        
        bowlingPins = sortedBowlingPins
       
    }
    
    mutating func sortMusicCDs() {
        let sortedMusicCDs = musicCDs.sorted { (musicCD1, musicCD2) -> Bool in
            switch musicCD1.name    {
            case "Drank":
                musicCDs.insert(musicCD1, at: 0)
                return true
            default:
                return musicCD1.name > musicCD2.name
            }
        }
        
        self.musicCDs = sortedMusicCDs
    }
    
    mutating func changeColorOfAllPins(to color: Color) {
        
        let changedPins = bowlingPins.map { (pin) -> BowlingPin in
            
            var newPin = pin
            
            newPin.changeColor(to: color)
            
            return pin
        }
        
        bowlingPins = changedPins
    }
    
}


struct Ship {
    var name: String
    var age: Int
}


struct Book {
    var name: String
    var year: Int
    var author: String
}


struct BowlingPin {
    var name: String
    var film: String
    var color: Color
}


extension BowlingPin {
    mutating func changeColor(to color: Color) {
        self.color = color
    }
}


enum Color: Int {
    case red, orange, yellow, green, blue, indigo, violet
}

struct MusicCD {
    var name: String
    var year: Int
    var songs: [String]
}
