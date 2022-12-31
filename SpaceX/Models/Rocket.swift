//
//  Rocket.swift
//  SpaceX
//
//  Created by Денис Харына on 21.12.2022.
//

import Foundation

struct Rocket: Codable {
    let height, diameter: Diameter
    let mass: Mass
    let firstStage: FirstStage
    let secondStage: SecondStage
    let payloadWeights: [PayloadWeights]
    let flickrImages: [String]
    let name: String
    let firstFlight: String
    let costPerLaunch: Int
    let country: String

    enum CodingKeys: String, CodingKey {
        case height, diameter, mass, name, country
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case payloadWeights = "payload_weights"
        case flickrImages = "flickr_images"
        case costPerLaunch = "cost_per_launch"
        case firstFlight = "first_flight"
    }
}

// MARK: - FirstStage
struct FirstStage: Codable {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - SecondStage
struct SecondStage: Codable {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

struct PayloadWeights: Codable {
    let kg, lb: Int
}

// MARK: - Diameter
struct Diameter: Codable {
    let meters, feet: Double?
}

// MARK: - Mass
struct Mass: Codable {
    let kg, lb: Int
}
