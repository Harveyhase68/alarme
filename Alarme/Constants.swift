//
//  Constants.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-04-21.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import Foundation

struct K {
    static let darkMode = "isDarkMode"
    static let defaults = UserDefaults.standard
    
    struct Image {
        static let play = "play.circle.fill"
        static let stop = "stop.fill"
        static let circleButton = "circle-button.png"
        static let noAlarmSetUp = "funny-no-alarm-temp.png"
    }
    
    struct Color {
        static let white = "color-text-white"
    }
    
    struct Cell {
        static let alarmCell = "alarmCell"
        static let soundCell = "soundCell"
        static let soundCellNib = "SoundListCell"
        static let repeatDaysCell = "repeatDaysCell"
    }
    
    struct Segue {
        static let goToAlarmEdit = "goToAlarmEditScene"
        static let goToSounds = "goToSoundsScene"
        static let goToOptions = "goToOptionsScene"
        static let goToSettings = "goToSettingsScene"
    }
    
    struct Sound {
        static let sound1 = "Mr. Mason"
        static let sound2 = "Matador's Entry"
        static let sound3 = "Make it Snappy"
        static let sound4 = "It Takes One"
        static let sound5 = "Fields of Joy"
        static let sound6 = "Enchanting"
        static let sound7 = "Country Pickin'"
        static let sound8 = "Blugrass Billy"
        static let sound9 = "Black Fedora"
        static let sound10 = "Banana Tree"
    }
    
    struct Error {
        static let title = "Loading error"
        static let action = "OK"
    }
    
}
