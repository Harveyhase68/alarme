//
//  KeyboardManager.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-05-08.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import UIKit

struct KeyboardManager {
    
    func dismissKeyboardOnTapAnywhere(on view: UIView) {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboardOnScroll(on tableView: UITableView) {
        tableView.keyboardDismissMode = .onDrag
    }
    
}

//MARK: - Text field delegate

extension AlarmEditTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
}
