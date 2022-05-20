//
//  OrderTableViewCell.swift
//  HotCoffee
//
//  Created by 김응철 on 2022/05/20.
//

import UIKit
import SnapKit

class OrderTableViewCell: UITableViewCell {
    static let identifier = "OrderTableViewCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    var sizeLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private func setupUI() {
        [ titleLabel, sizeLabel ]
            .forEach { contentView.addSubview($0) }
        
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview().inset(16)
        }
        
        sizeLabel.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview().inset(16)
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
