//
//  LaunchesTableViewCell.swift
//  SpaceX
//
//  Created by Денис Харына on 06.01.2023.
//

import UIKit

class LaunchesTableViewCell: UITableViewCell {
    //MARK: - Main Properties
    private let background = UIView()
    private let launchName = UILabel()

    //MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        constrain()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    private func configureUI() {
        background.backgroundColor = Style.Colors.grayBackground
        background.layer.cornerRadius = 24
        
        launchName.text = "Some Text"
    }
    private func constrain() {
        contentView.addSubview(background)
        background.addSubview(launchName)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        launchName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: contentView.topAnchor),
            background.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            background.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -64),
            background.heightAnchor.constraint(equalToConstant: 100),
            
            launchName.topAnchor.constraint(equalTo: background.topAnchor, constant: 16),
            launchName.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 32)
        ])
    }
}
