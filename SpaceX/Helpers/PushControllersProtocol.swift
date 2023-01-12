//
//  PushControllersProtocol.swift
//  SpaceX
//
//  Created by Денис Харына on 12.01.2023.
//

import Foundation

protocol PushControllersDelegate: AnyObject {
    func pushLaunchesController(title: String)
    func presentSettingsController()
}
