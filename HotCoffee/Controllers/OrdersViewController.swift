//
//  OrdersViewController.swift
//  HotCoffee
//
//  Created by 김응철 on 2022/05/20.
//

import UIKit
import SnapKit

class OrdersViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

