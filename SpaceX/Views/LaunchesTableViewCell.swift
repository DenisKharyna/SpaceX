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
    private let launchDate = UILabel()
    private let successIcon = UIImageView()

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
        launchName.font = Style.Fonts.labGrotesqueRegular?.withSize(20)
        launchName.textColor = .white

        launchDate.text = "Date"
        launchDate.font = Style.Fonts.labGrotesqueRegular?.withSize(16)
        launchDate.textColor = Style.Colors.rocketInfoTextColor
        
        successIcon.image = UIImage(named: "SuccessTrueIcon")
    }
    private func constrain() {
        let text = UIStackView(arrangedSubviews: [launchName, launchDate])
        text.axis = .vertical
        text.alignment = .fill
        
        contentView.addSubview(background)
        background.addSubview(text)
        background.addSubview(successIcon)

        background.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        successIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: contentView.topAnchor),
            background.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            background.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -64),
            background.heightAnchor.constraint(equalToConstant: 100),
            
            text.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            text.heightAnchor.constraint(equalToConstant: 52),
            text.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 32),
            
            successIcon.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            successIcon.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -32),
            successIcon.widthAnchor.constraint(equalToConstant: 32),
            successIcon.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}
