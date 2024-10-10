//
//  Car Model.swift
//  Alamofire car api
//
//  Created by Win Yu Maung on 23/09/2024.
//

import Foundation

// Model for the car data
struct Car: Codable {
    let id: Int
    let brand: String
    let model: String
    let year: Int
    let images: [String]
    let price: Int
    let location: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case brand = "Brand"
        case model = "Model"
        case year = "Year"
        case images = "Image"
        case price = "Price"
        case location = "Location"
        case type = "Type"
    }
}

// Wrapper for the car list (since your JSON starts with {"Cars": [...]})
struct CarList: Codable {
    let cars: [Car]

    enum CodingKeys: String, CodingKey {
        case cars = "Cars"
    }
}
