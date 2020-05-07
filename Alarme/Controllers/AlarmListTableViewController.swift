//
//  AlarmListTableViewController.swift
//  Alarme
//
//  Created by Danijela Vrzan on 2020-04-28.
//  Copyright © 2020 Danijela Vrzan. All rights reserved.
//

import UIKit

class AlarmListTableViewController: UITableViewController {
    
    var tempArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    func configureTableView() {
        tableView.hideEmptyCells()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tempArray.count == 0 {
            self.tableView.showEmptyMessage(as: UIImage(named: "funny-no-alarm-temp")!)
        } else {
            self.tableView.restoreToNormalState()
        }
        
        return tempArray.count
    }


}
