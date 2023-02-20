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
    
    func configureSettingsOptionView(title: String, segmentedControl: UISegmentedControl) {
        translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = title
        label.font = Style.Fonts.labGrotesqueRegular?.withSize(16)
        label.textColor = Style.Colors.mainTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let segControl = segmentedControl
        segControl.backgroundColor = Style.Colors.grayBackground
        segControl.selectedSegmentTintColor = .white
        let titleTextAttributes1 = [.foregroundColor: Style.Colors.rocketInfoTextColor, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
        let titleTextAttributes2 = [.foregroundColor: Style.Colors.pageControlBackground, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
        segmentedControl.setTitleTextAttributes(titleTextAttributes1, for: .normal)
        segmentedControl.setTitleTextAttributes(titleTextAttributes2, for: .selected)
        segControl.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        addSubview(segControl)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            segControl.widthAnchor.constraint(equalToConstant: 115),
            segControl.heightAnchor.constraint(equalToConstant: 40),
            segControl.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            segControl.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
