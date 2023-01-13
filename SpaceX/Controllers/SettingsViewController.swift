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
        view.backgroundColor = .black
        self.navigationItem.title = "Settings"
        
        closeButton.setTitle("Close", for: .normal)
        closeButton.titleLabel?.font = Style.Fonts.labGrotesqueBold?.withSize(18)
        closeButton.tintColor = .white
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    private func constrain() {
        navigationController?.navigationBar.addSubview(closeButton)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: navigationController!.navigationBar.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: navigationController!.navigationBar.trailingAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 120),
            closeButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
