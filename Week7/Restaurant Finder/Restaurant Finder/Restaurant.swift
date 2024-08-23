//
//  Restaurant.swift
//  Restaurant Finder
//
//  Created by Kiratijuta Bhumichitr on 10/8/2567 BE.
//

import Foundation

struct RestaurantClass: Codable {
    let restaurants: [Restaurant]

    enum CodingKeys: String, CodingKey {
        case restaurants = "items"
    }
}

struct Restaurant: Codable {
    let name: String
    let location: String
    let description: String
    let rating: Double
    let openingTime: String
    let price : String
    let images: [String]

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case location = "location"
        case description = "description"
        case rating = "rating"
        case openingTime = "openingTime"
        case price = "price"
        case images = "images"
    }
}
