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
    @IBOutlet var optionLabel: UILabel!
    @IBOutlet var snoozeSwitch: UISwitch!
    @IBOutlet var optionCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Sound methods
    
    func updatedSelectedSoundName() {
        if let selectedSound = selectedSound,
            let soundLabel = soundLabel {
            soundLabel.text = selectedSound.name
        }
    }
    
    @IBAction func unwindToAlarmEdit(_ unwindSegue: UIStoryboardSegue) {
        updatedSelectedSoundName()
    }
    
    //MARK: - Snooze methods
    
    @IBAction func snoozeSwitchValueChanged(_ sender: UISwitch) {
        hideOptionCellFromTableView()
        //tableView.reloadData()
    }
    
    func hideOptionCellFromTableView() {
        if snoozeSwitch.isOn {
            optionCell.isHidden = true
        } else {
            optionCell.isHidden = false
        }
        
    }
    
}

