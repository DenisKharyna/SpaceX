//
//  UIViewExtension.swift
//  SpaceX
//
//  Created by Денис Харына on 27.12.2022.
//

import Foundation
import UIKit

extension UIView {
    func configureViewWithText(firstFieldText: String, secondFieldText: String, thirdFieldText: String, firstLabel: UILabel, secondLabel: UILabel, thirdLabel: UILabel) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let firstField = UILabel()
        let secondField = UILabel()
        let thirdField = UILabel()
        firstField.configureNameUILable(with: firstFieldText)
        secondField.configureNameUILable(with: secondFieldText)
        thirdField.configureNameUILable(with: thirdFieldText)
        
        firstLabel.configureInfoUILable()
        secondLabel.configureInfoUILable()
        thirdLabel.configureInfoUILable()
        
        let firstHorizontalView = UIStackView(arrangedSubviews: [firstField, firstLabel])
        firstHorizontalView.axis = .horizontal
        firstHorizontalView.alignment = .fill
        let secondHorizontalView = UIStackView(arrangedSubviews: [secondField, secondLabel])
        secondHorizontalView.axis = .horizontal
        secondHorizontalView.alignment = .fill
        let thirdHorizontalView = UIStackView(arrangedSubviews: [thirdField, thirdLabel])
        thirdHorizontalView.axis = .horizontal
        thirdHorizontalView.alignment = .fill
        
        let mainStack = UIStackView(arrangedSubviews: [firstHorizontalView, secondHorizontalView, thirdHorizontalView])
        mainStack.axis = .vertical
        mainStack.alignment = .fill
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStack.widthAnchor.constraint(equalTo: view.widthAnchor),
            mainStack.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            firstHorizontalView.widthAnchor.constraint(equalTo: view.widthAnchor),
            firstHorizontalView.heightAnchor.constraint(equalToConstant: 24),
            
            secondHorizontalView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            thirdHorizontalView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
}
