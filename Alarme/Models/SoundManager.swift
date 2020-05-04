//
//  SoundManager.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-05-04.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import UIKit
import AVFoundation

struct SoundManager {
    
    var player: AVAudioPlayer?
    var sound: Sound?
    
    func currentlyPlaying() -> Sound? {
        return sound
    }

    mutating func play(this sound: Sound) {
        stop()
        do {
            guard let url = Bundle.main.url(forResource: sound.name, withExtension: ".mp3") else { return }
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            self.sound = sound
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    mutating func stop() {
        player?.stop()
        self.sound = nil
    }
    
}
