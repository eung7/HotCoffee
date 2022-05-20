//
//  OrdersViewController.swift
//  HotCoffee
//
//  Created by 김응철 on 2022/05/20.
//

import UIKit
import SnapKit

class OrdersViewController: UIViewController {
    var viewModel = OrderListViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            OrderTableViewCell.self,
            forCellReuseIdentifier: OrderTableViewCell.identifier
        )
        tableView.dataSource = self
        
        return tableView
    }()
    
    var addBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem()
        barButtonItem.image = UIImage(systemName: "plus")
        
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        populateOrders()
    }
    
    private func setupUI() {
        title = "Orders"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .done,
            target: self,
            action: #selector(didTapAddButton)
        )
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func populateOrders() {
        WebSerivce().load(resource: Order.all) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let orders):
                self.viewModel.ordersViewModel = orders.map { OrderViewModel(order: $0) }
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension OrdersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModel.orderViewModel(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.identifier,
                                                       for: indexPath) as? OrderTableViewCell else {
            return UITableViewCell() }
        cell.titleLabel.text = viewModel.name
        cell.sizeLabel.text = viewModel.size
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.ordersViewModel.count
    }
}

/// @objc Methods
extension OrdersViewController {
    @objc func didTapAddButton() {
        let addVC = AddOrderViewController()
        let vc = UINavigationController(rootViewController: addVC)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
        addVC.didSaveButton = { [weak self] order in
            guard let self = self else { return }
            addVC.dismiss(animated: true)
            let orderVM = OrderViewModel(order: order)
            self.viewModel.ordersViewModel.append(orderVM)
            self.tableView.insertRows(at: [IndexPath.init(row: self.viewModel.ordersViewModel.count - 1, section: 0)], with: .automatic)
        }
    }
}
