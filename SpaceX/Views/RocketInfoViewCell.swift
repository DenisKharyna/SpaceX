//
//  RocketInfoViewCell.swift
//  SpaceX
//
//  Created by Денис Харына on 21.12.2022.
//

import UIKit

class RocketInfoViewCell: UICollectionViewCell {
    //MARK: - Main Properties
    let numberLabel = UILabel()
    let text = UILabel()
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        constrain()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    private func configureUI() {
        numberLabel.font = UIFont.boldSystemFont(ofSize: 16)
        numberLabel.textColor = Style.Colors.mainTextColor
        
        text.font = UIFont.systemFont(ofSize: 14)
        text.textColor = Style.Colors.secondaryTextColor
    }
    private func constrain() {
        contentView.addSubview(numberLabel)
        contentView.addSubview(text)
        
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 28),
            numberLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            text.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 4),
            text.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

}
