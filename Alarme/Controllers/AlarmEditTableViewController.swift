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
    let keyboardManager = KeyboardManager()
    
    @IBOutlet var soundLabel: UILabel!
    @IBOutlet var optionLabel: UILabel!
    @IBOutlet var snoozeSwitch: UISwitch!
    @IBOutlet var optionCell: UITableViewCell!
    @IBOutlet var alarmLabelTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmLabelTextField.delegate = self
        keyboardManager.dismissKeyboardOnScroll(on: self.tableView)
        keyboardManager.dismissKeyboardOnTapAnywhere(on: self.view)

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
    }
    
    func hideOptionCellFromTableView() {
        if snoozeSwitch.isOn {
            optionCell.isHidden = true
        } else {
            optionCell.isHidden = false
        }
    }
    
}
