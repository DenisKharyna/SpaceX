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
    }
    private func constrain() {
        navigationController?.navigationBar.addSubview(closeButton)
        view.addSubview(firstSection)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        firstSection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: navigationController!.navigationBar.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: navigationController!.navigationBar.trailingAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 120),
            closeButton.heightAnchor.constraint(equalToConstant: 60),
            
            firstSection.widthAnchor.constraint(equalToConstant: view.frame.width - 56),
            firstSection.heightAnchor.constraint(equalToConstant: 40),
            firstSection.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstSection.topAnchor.constraint(equalTo: view.topAnchor, constant: 106)
        ])
    }
}
