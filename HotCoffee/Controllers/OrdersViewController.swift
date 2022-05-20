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
        populateOrders()
        print("dd")
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func populateOrders() {
        guard let coffeeOrdersURL = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL wass incorrect"); return
        }
        let resource = Resource<[Order]>(url: coffeeOrdersURL)
        WebSerivce().load(resource: resource) { result in
            switch result {
            case .success(let orders):
                print(orders)
            case .failure(let error):
                print(error)
            }
        }
    }
}

