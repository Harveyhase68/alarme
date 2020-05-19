//
//  Sounds.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-05-04.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import Foundation

struct Sounds {
    
    var sounds = [Sound]()
    var count: Int {
        get {
            return sounds.count
        }
    }
    
    init() {
        sounds = [
            Sound(id: 1, name: K.Sound.sound1, duration: 31.0),
            Sound(id: 2, name: K.Sound.sound2, duration: 29.70),
            Sound(id: 3, name: K.Sound.sound3, duration: 31.20),
            Sound(id: 4, name: K.Sound.sound4, duration: 34.20),
            Sound(id: 5, name: K.Sound.sound5, duration: 31.20),
            Sound(id: 6, name: K.Sound.sound6, duration: 31.20),
            Sound(id: 7, name: K.Sound.sound7, duration: 35.70),
            Sound(id: 8, name: K.Sound.sound8, duration: 31.20),
            Sound(id: 9, name: K.Sound.sound9, duration: 32.70),
            Sound(id: 10, name: K.Sound.sound10, duration: 31.20)]
    }
    
    func getSound(at position: Int) -> Sound? {
        guard 0...(sounds.count - 1) ~= position else {
            return nil
        }
        
        return sounds[position]
    }
    
    func getPosition(_ sound: Sound) -> Int? {
        return sounds.firstIndex { $0 == sound }
    }
    
}

