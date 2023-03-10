//
//  Style.swift
//  SpaceX
//
//  Created by Денис Харына on 21.12.2022.
//

import UIKit

struct Style {
    struct Colors {
        static let mainTextColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        static let secondaryTextColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1.0)
        static let rocketInfoTextColor = UIColor(red: 142/255, green: 142/255, blue: 143/255, alpha: 1.0)
        static let grayBackground = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1.0)
        static let pageControlBackground = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1.0)
    }
    struct Fonts {
        static let labGrotesqueRegular = UIFont(name: "LabGrotesque-Regular", size: UIFont.labelFontSize)
        static let labGrotesqueMedium = UIFont(name: "LabGrotesque-Medium", size: UIFont.labelFontSize)
        static let labGrotesqueBold = UIFont(name: "LabGrotesque-Bold", size: UIFont.labelFontSize)
    }
}
