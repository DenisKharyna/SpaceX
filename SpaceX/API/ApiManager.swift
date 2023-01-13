//
//  ApiManager.swift
//  SpaceX
//
//  Created by Денис Харына on 21.12.2022.
//

import Foundation

class ApiManager {
    static let shared = ApiManager()
    
    func getRockets(completion: @escaping([Rocket]) -> Void) {
        var request = URLRequest(url: URL(string: "https://api.spacexdata.com/v4/rockets")!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let rockets = try? JSONDecoder().decode([Rocket].self, from: data) {
                completion(rockets)
            } else {
                print(error ?? "error")
            }
        }
        task.resume()
    }
    
    func getLaunches(completion: @escaping([Launch]) -> Void) {
        var request = URLRequest(url: URL(string: "https://api.spacexdata.com/v4/launches")!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let launches = try? JSONDecoder().decode([Launch].self, from: data) {
                completion(launches)
            } else {
                print(error ?? "error2")
            }
        }
        task.resume()
    }
}
