//
//  AlarmEditTableViewController.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-05-05.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import UIKit

class AlarmEditTableViewController: UITableViewController {
    
    var alarm: Alarm?
    var selectedSound: Sound?
    
    @IBOutlet var soundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func updatedSelectedSoundName() {
        if let selectedSound = selectedSound,
            let soundLabel = soundLabel {
            soundLabel.text = selectedSound.name
        }
    }
    
    @IBAction func unwindToAlarmEdit(_ unwindSegue: UIStoryboardSegue) {
        updatedSelectedSoundName()
    }

}
