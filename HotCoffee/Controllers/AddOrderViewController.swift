//
//  AddOrderViewController.swift
//  HotCoffee
//
//  Created by 김응철 on 2022/05/20.
//

import UIKit
import SnapKit

class AddOrderViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    var coffeeSize: UISegmentedControl = {
        let control = UISegmentedControl()
        control.insertSegment(withTitle: "Small", at: 0, animated: false)
        control.insertSegment(withTitle: "Medium", at: 1, animated: false)
        control.insertSegment(withTitle: "Large", at: 2, animated: false)
        
        return control
    }()
    
    var nameTextField: UITextField = {
        let textField = UITextField()
        
        return textField
    }()
    
    var emailTextField: UITextField = {
        let textField = UITextField()
        
        return textField
    }()
    
    var closeBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem()
        barButtonItem.title = "Close"
        
        return barButtonItem
    }()
    
    var saveBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem()
        barButtonItem.title = "Save"
        
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Add New Order"
    }
}
