//
//  Launch.swift
//  SpaceX
//
//  Created by Денис Харына on 13.01.2023.
//

import Foundation

struct Launch: Codable {
    let rocket: String
    let success: Bool
    let name: String
    let dateUnix: Int

    enum CodingKeys: String, CodingKey {
        case rocket, success, name
        case dateUnix = "date_unix"
    }
}
