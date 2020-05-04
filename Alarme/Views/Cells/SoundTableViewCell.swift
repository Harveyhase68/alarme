//
//  SoundTableViewCell.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-04-03.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import UIKit

protocol SoundTableViewCellDelegate {
    func didTapPlayButton(playButton: UIButton)
}

class SoundTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    
    var soundItem: Sound!
    var delegate: SoundTableViewCellDelegate?
    
    func setSound(sound: Sound) {
        soundItem = sound
        nameLabel.text = sound.name.replacingOccurrences(of: ".mp3", with: "")
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        delegate?.didTapPlayButton(playButton: playButton)
    }
    
}
