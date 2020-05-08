//
//  UITableView+ShowInfoWhenEmpty.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-05-07.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import UIKit

extension UITableView {
    
    func showEmptyMessage(as image: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        imageView.image = image
        imageView.sizeToFit()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.backgroundView = imageView
        self.separatorStyle = .none
        self.isScrollEnabled = false
    }
    
    func restoreToNormalState() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
        self.isScrollEnabled = true
    }
    
}
