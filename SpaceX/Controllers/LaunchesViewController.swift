//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Денис Харына on 06.01.2023.
//

import UIKit

class LaunchesViewController: UITableViewController {
    let cellId = "cellId"
    var allLaunches = [Launch]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    //MARK: - Main Properties
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    private func configureUI() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .white
        
        tableView.register(LaunchesTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .black
        tableView.separatorColor = .clear
        tableView.bounces = false
        tableView.isUserInteractionEnabled = true
        tableView.allowsSelection = false
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
    }
}

extension LaunchesViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allLaunches.count > 5 ? 10 : allLaunches.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! LaunchesTableViewCell
        let launch = allLaunches[indexPath.row]
        cell.launchName.text = launch.name
        let date = Date(timeIntervalSince1970: TimeInterval(launch.dateUnix))
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM, yyyy"
        cell.launchDate.text = formatter.string(from: date)
        if let success = launch.success {
            cell.successIcon.image = success ? UIImage(named: "SuccessTrueIcon") : UIImage(named: "SuccessFalseIcon")
        } else {
            cell.successIcon.image = UIImage(named: "SuccessTrueIcon")
        }
        return cell
    }
}
