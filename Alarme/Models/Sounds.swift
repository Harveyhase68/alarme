//
//  Sounds.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-05-04.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import UIKit

struct Sounds {
    
    var sounds = [Sound]()
    var count: Int {
        get {
            return sounds.count
        }
    }
    
    init() {
        sounds = [
            Sound(name: K.Sound.sound1),
            Sound(name: K.Sound.sound2),
            Sound(name: K.Sound.sound3),
            Sound(name: K.Sound.sound4),
            Sound(name: K.Sound.sound5),
            Sound(name: K.Sound.sound6),
            Sound(name: K.Sound.sound7),
            Sound(name: K.Sound.sound8),
            Sound(name: K.Sound.sound9),
            Sound(name: K.Sound.sound10)]
    }

    func getSound(at position: Int) -> Sound? {
        guard 0...(sounds.count - 1) ~= position else { return nil }
        return sounds[position]
    }
    
    func getPosition(_ sound: Sound) -> Int? {
        return sounds.firstIndex { $0 == sound }
    }
    
}

