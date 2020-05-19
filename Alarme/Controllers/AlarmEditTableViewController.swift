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
        sender.isSelected = !sender.isSelected
        for sender in repeatDaysButtonArray {
            sender.setBackgroundImage(UIImage(named: "circle-button.png"), for: .selected)
            sender.setTitleColor(UIColor(named: "color-text-white"), for: .selected)
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
        if snoozeSwitch.isOn {
            optionCell.isHidden = true
        } else {
            optionCell.isHidden = false
        }
    }
    
}
