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
    
    var isDarkMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Read the current switch state from UserDefaults and if the switch state has changed, implement the new style immediately
        darkModeSwitch.isOn = K.defaults.bool(forKey: K.darkMode)
        darkModeSwitchValueChanged(darkModeSwitch)
    }
    
    //MARK: - Style Preference
    
    @IBAction func darkModeSwitchValueChanged(_ sender: UISwitch) {
        isDarkMode = sender.isOn
        updateStyle()
    }
    
    func updateStyle() {
        UIView.animate(withDuration: 0.4) {
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = self.isDarkMode ? .dark : .light
            }
            K.defaults.set(self.isDarkMode, forKey: K.darkMode)
        }
    }
    
}
