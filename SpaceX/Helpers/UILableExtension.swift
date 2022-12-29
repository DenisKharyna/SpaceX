//
//  UILable + Extension.swift
//  SpaceX
//
//  Created by Денис Харына on 27.12.2022.
//

import Foundation
import UIKit

extension UILabel {
    func configureNameUILable(with text: String) {
        self.text = text
        textColor = Style.Colors.secondaryTextColor
        font = UIFont.systemFont(ofSize: 16)
    }
    func configureInfoUILable() {
        textColor = Style.Colors.mainTextColor
        font = UIFont.boldSystemFont(ofSize: 16)
    }
    func configureStageUILable(with text: String) {
        self.text = text.uppercased()
        textColor = Style.Colors.mainTextColor
        font = UIFont.boldSystemFont(ofSize: 16)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
