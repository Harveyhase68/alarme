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
    var repeatDays = [String]()
    let days = [1: "Mon", 2: "Tue", 3: "Wed", 4: "Thu", 5: "Fri", 6: "Sat", 7: "Sun"]
    
    @IBOutlet var soundLabel: UILabel!
    @IBOutlet var optionLabel: UILabel!
    @IBOutlet var snoozeSwitch: UISwitch!
    @IBOutlet var optionCell: UITableViewCell!
    @IBOutlet var alarmLabelTextField: UITextField!
    @IBOutlet var repeatDaysLabel: UILabel!
    @IBOutlet var repeatDaysButtonArray: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmLabelTextField.delegate = self
        keyboardManager.dismissKeyboardOnScroll(on: self.tableView)
        keyboardManager.dismissKeyboardOnTapAnywhere(on: self.view)
    }
    
    //MARK: - Repeat Methods
    
    @IBAction func repeatDaysButtonTapped(_ sender: UIButton) {
        repeatDaysLabel.text = ""
        sender.isSelected = !sender.isSelected
        for sender in repeatDaysButtonArray {
            sender.setBackgroundImage(UIImage(named: K.Image.circleButton), for: .selected)
            sender.setTitleColor(UIColor(named: K.Color.white), for: .selected)
        }
        if let day = days[sender.tag] {
            if let index = repeatDays.firstIndex(of: day) {
                repeatDays.remove(at: index)
            } else {
                repeatDays.append(day)
            }
        }
        for day in repeatDays {
            repeatDaysLabel.text! += day + "  "
        }
        if repeatDays.isEmpty {
            repeatDaysLabel.text = "None"
        }
    }
    
    //MARK: - Sound methods
    
    func updateSelectedSoundName() {
        if let selectedSound = selectedSound,
            let soundLabel = soundLabel {
            soundLabel.text = selectedSound.name
        }
    }
    
    @IBAction func unwindToAlarmEdit(_ unwindSegue: UIStoryboardSegue) {
        updateSelectedSoundName()
    }
    
    //MARK: - Snooze methods
    
    @IBAction func snoozeSwitchValueChanged(_ sender: UISwitch) {
        hideOptionCellFromTableView()
    }
    
    func hideOptionCellFromTableView() {
        optionCell.isHidden = snoozeSwitch.isOn
    }
    
}
