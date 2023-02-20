//
//  SettingsViewController.swift
//  SpaceX
//
//  Created by Денис Харына on 13.01.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    //MARK: - Main Properties
    private let closeButton = UIButton()
    
    private let firstSection = UIView()
    private let heightSegControl = UISegmentedControl(items: ["m", "ft"])
    private let secondSection = UIView()
    private let diameterSegControl = UISegmentedControl(items: ["m", "ft"])
    private let thirdSection = UIView()
    private let massSegControl = UISegmentedControl(items: ["kg", "lb"])
    private let fourthSection = UIView()
    private let payloadSegControl = UISegmentedControl(items: ["kg", "lb"])
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        constrain()
    }
    
    //MARK: - Selector
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true)
    }
    
    //MARK: - Helpers
    private func configureUI() {
        view.backgroundColor = Style.Colors.pageControlBackground
        self.navigationItem.title = "Settings"
        
        closeButton.setTitle("Close", for: .normal)
        closeButton.titleLabel?.font = Style.Fonts.labGrotesqueBold?.withSize(18)
        closeButton.tintColor = .white
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        firstSection.configureSettingsOptionView(title: "Height", segmentedControl: heightSegControl)
        secondSection.configureSettingsOptionView(title: "Diameter", segmentedControl: diameterSegControl)
        thirdSection.configureSettingsOptionView(title: "Mass", segmentedControl: massSegControl)
        fourthSection.configureSettingsOptionView(title: "Payload", segmentedControl: payloadSegControl)
    }
    private func constrain() {
        navigationController?.navigationBar.addSubview(closeButton)
        let stack = UIStackView(arrangedSubviews: [firstSection, secondSection, thirdSection, fourthSection])
        stack.axis = .vertical
        stack.spacing = 24
        view.addSubview(stack)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: navigationController!.navigationBar.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: navigationController!.navigationBar.trailingAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 120),
            closeButton.heightAnchor.constraint(equalToConstant: 60),
            
            stack.widthAnchor.constraint(equalToConstant: view.frame.width - 56),
            stack.heightAnchor.constraint(equalToConstant: 232),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 106)
        ])
    }
}
