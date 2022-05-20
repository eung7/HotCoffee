//
//  AddOrderTableViewCell.swift
//  HotCoffee
//
//  Created by 김응철 on 2022/05/20.
//

import UIKit
import SnapKit

class AddOrderTableViewCell: UITableViewCell {
    static let identifier = "AddOrderTableViewCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview().inset(16)
        }
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
