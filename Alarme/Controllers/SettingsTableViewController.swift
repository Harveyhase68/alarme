//
//  SettingsTableViewController.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-04-21.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    @IBOutlet var darkModeSwitch: UISwitch!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Read the current switch state from UserDefaults
        darkModeSwitch.isOn = defaults.bool(forKey: Constants.isDarkMode)
        // Implement new switch state immediately
        darkModeSwitchValueChanged(darkModeSwitch)
    }
    
    @IBAction func darkModeSwitchValueChanged(_ sender: UISwitch) {
        switch darkModeSwitch.isOn {
        case true:
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .dark
            }
            // Save the new state to UserDefaults
            defaults.set(true, forKey: Constants.isDarkMode)
        case false:
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .light
            }
            // Save the new state to UserDefaults
            defaults.set(false, forKey: Constants.isDarkMode)
        }
    }
    
}
