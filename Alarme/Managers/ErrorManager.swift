//
//  ErrorManager.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-05-04.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import Foundation

enum ErrorFound: Error {
    case x
}

extension ErrorFound: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .x:
            return NSLocalizedString("Invalid x; please try again.", comment: "Invalid x")
    }
    
}

//func didFailWithError(error: Error) {
//    DispatchQueue.main.async {
//        let alert = UIAlertController(title: K.Error.title, message: error.localizedDescription, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: K.Error.action, style: .default))
//        self.present(alert, animated: true)
//    }
//
    
}
