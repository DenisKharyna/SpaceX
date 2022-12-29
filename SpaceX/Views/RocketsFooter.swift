//
//  RocketsFooter.swift
//  SpaceX
//
//  Created by Денис Харына on 21.12.2022.
//

import UIKit

class RocketsFooter: UICollectionReusableView {
    var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ldnskjcbjdsbc"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        addSubview(textLabel)
        textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
        textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
