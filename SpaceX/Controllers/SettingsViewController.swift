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
    
    let defaults = UserDefaults.standard
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureSegments()
        constrain()
    }
    
    //MARK: - Configure Segments
    private func configureSegments() {
        heightSegControl.selectedSegmentIndex = defaults.string(forKey: K.heightUserDefaultsKey) == "m" ? 0 : 1
        diameterSegControl.selectedSegmentIndex = defaults.string(forKey: K.diameterUserDefaultsKey) == "m" ? 0 : 1
        massSegControl.selectedSegmentIndex = defaults.string(forKey: K.massUserDefaultsKey) == "kg" ? 0 : 1
        payloadSegControl.selectedSegmentIndex = defaults.string(forKey: K.payloadUserDefaultsKey) == "kg" ? 0 : 1
    }
    
    //MARK: - Selector
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true)
    }
    @objc private func heightControlChanged(_ segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            defaults.set("m", forKey: K.heightUserDefaultsKey)
        } else {
            defaults.set("ft", forKey: K.heightUserDefaultsKey)
        }
    }
    @objc private func diameterControlChanged(_ segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            defaults.set("m", forKey: K.diameterUserDefaultsKey)
        } else {
            defaults.set("ft", forKey: K.diameterUserDefaultsKey)
        }
    }
    @objc private func massControlChanged(_ segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            defaults.set("kg", forKey: K.massUserDefaultsKey)
        } else {
            defaults.set("lb", forKey: K.massUserDefaultsKey)
        }
    }
    @objc private func payloadControlChanged(_ segmentedControl: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            defaults.set("kg", forKey: K.payloadUserDefaultsKey)
        } else {
            defaults.set("lb", forKey: K.payloadUserDefaultsKey)
        }
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
        heightSegControl.addTarget(self, action: #selector(heightControlChanged(_:)), for: .valueChanged)
        
        secondSection.configureSettingsOptionView(title: "Diameter", segmentedControl: diameterSegControl)
        diameterSegControl.addTarget(self, action: #selector(diameterControlChanged(_:)), for: .valueChanged)
        
        thirdSection.configureSettingsOptionView(title: "Mass", segmentedControl: massSegControl)
        massSegControl.addTarget(self, action: #selector(massControlChanged(_:)), for: .valueChanged)
        
        fourthSection.configureSettingsOptionView(title: "Payload", segmentedControl: payloadSegControl)
        payloadSegControl.addTarget(self, action: #selector(payloadControlChanged(_:)), for: .valueChanged)
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
