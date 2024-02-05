//
//  DemoMainViewControllerView.swift
//
//  Created by Faiizziii on 02.02.2024.
//  Copyright © 2024 Faiizziii. All rights reserved.
//

import UIKit

class DemoMainViewControllerView: UIView {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "DemoProjectTableViewCell", bundle: nil), forCellReuseIdentifier: "DemoProjectTableViewCell")
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!
    
}
extension DemoMainViewControllerView {
    
}
