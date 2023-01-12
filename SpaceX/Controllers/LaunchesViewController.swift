//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Денис Харына on 06.01.2023.
//

import UIKit

class LaunchesViewController: UITableViewController {
    let cellId = "cellId"
    //MARK: - Main Properties
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        ApiManager.shared.getRockets { rockets in
//            self.allRockets = rockets
//        }
        configureUI()
        constrain()
    }
    
    //MARK: - Helpers
    private func configureUI() {
        navigationController?.isNavigationBarHidden = false
        
        tableView.register(LaunchesTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .black
        tableView.separatorColor = .clear
        tableView.bounces = false
        tableView.isUserInteractionEnabled = false
    }
    private func constrain() {
        
    }
}

extension LaunchesViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! LaunchesTableViewCell
        //cell.backgroundColor = .red
        return cell
    }
}