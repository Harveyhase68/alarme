//
//  UITableView+HideEmptyCells.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-05-07.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import UIKit

extension UITableView {
    
    func hideEmptyCells() {
        tableFooterView = UIView()
    }
    
}
