//
//  RepeatDaysCell.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-05-12.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import UIKit

protocol RepeatDaysCellDelegate {
    func didTapRepeatDaysButton(repeatDaysButtons: [UIButton])
}

class RepeatDayCell: UITableViewCell {
    
    @IBOutlet var buttons: [UIButton]!
    
    var delegate: RepeatDaysCellDelegate?
    
    @IBAction func repeatDaysButtonTapped(_ sender: UIButton) {
        delegate?.didTapRepeatDaysButton(repeatDaysButtons: buttons)
    }
    
}
