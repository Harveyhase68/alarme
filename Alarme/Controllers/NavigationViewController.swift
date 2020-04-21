//
//  NavigationViewController.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-04-21.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {
    
    override func viewDidLayoutSubviews() {
        
        let isDarkMode = UserDefaults.standard.bool(forKey: Constants.isDarkMode)
        
        switch isDarkMode {
        case true:
            overrideUserInterfaceStyle = .dark
        case false:
            overrideUserInterfaceStyle = .light
        }
    }
    
}
