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
        
        let isDarkMode = K.defaults.bool(forKey: K.darkMode)
        overrideUserInterfaceStyle = isDarkMode ? .dark : .light
        
    }
    
}
