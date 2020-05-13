//
//  UpgradeViewController.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-05-13.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import UIKit

class UpgradeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Navigation
    
    @IBAction func didTapCancelButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: K.Segue.goToSettings, sender: sender)
    }
    
}
