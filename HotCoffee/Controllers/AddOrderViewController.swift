//
//  AddOrderViewController.swift
//  HotCoffee
//
//  Created by 김응철 on 2022/05/20.
//

import UIKit
import SnapKit

class AddOrderViewController: UIViewController {
    private var viewModel = AddCoffeeOrderViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AddOrderTableViewCell.self,
                           forCellReuseIdentifier: AddOrderTableViewCell.identifier)
        
        return tableView
    }()
    
    var coffeeSizeSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.insertSegment(withTitle: "Small", at: 0, animated: false)
        control.insertSegment(withTitle: "Medium", at: 1, animated: false)
        control.insertSegment(withTitle: "Large", at: 2, animated: false)
        
        return control
    }()
    
    var nameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        
        return textField
    }()
    
    var emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1

        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "Add New Order"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSaveButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(didTapCloseButton))
        
        [ tableView, coffeeSizeSegmentedControl, nameTextField, emailTextField]
            .forEach { view.addSubview($0) }
        
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height / 2)
        }
        
        coffeeSizeSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(coffeeSizeSegmentedControl.snp.bottom).offset(32)
            make.width.equalTo(200)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameTextField.snp.bottom).offset(8)
            make.width.equalTo(200)
        }
    }
}

/// @objc Methods
extension AddOrderViewController {
    @objc func didTapSaveButton() {
        
    }
    
    @objc func didTapCloseButton() {
        dismiss(animated: true)
    }
}

extension AddOrderViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddOrderTableViewCell.identifier,
                                                       for: indexPath) as? AddOrderTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = viewModel.types[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.types.count
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
