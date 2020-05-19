//
//  Alarm.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-04-21.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import Foundation

struct Alarm {
    var id: Int
    var time: Date
    var repeatDays: [String]
    var name: String
    var sound: Sound
    var option: String
}

//TODO: Remove after Core Data implementation
