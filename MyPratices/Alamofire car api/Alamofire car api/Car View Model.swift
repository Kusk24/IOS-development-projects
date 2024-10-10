//
//  Car View Model.swift
//  Alamofire car api
//
//  Created by Win Yu Maung on 23/09/2024.
//

import Foundation
import Alamofire
import UIKit
var cars : [Car] = []

struct CarViewModel {
    static let shared = CarViewModel()
    // Method to fetch cars from the API
//    func fetchCars() {
////        let url = "https://mocki.io/v1/a5ea996a-042f-418f-8cdb-0bac9954417f"
//        let url = "https://mocki.io/v1/87bd76d9-2fff-4f00-9f30-7b4ac85d1b62"
//        AF.request(url).responseDecodable(of: CarsResponse.self) { data in
//            switch data.result {
//            case .success(let carResponse):
//                cars = carResponse.cars
//                print("Cars loaded:", cars)
//            case .failure(let error):
//                print("Failed to load cars:", error)
//            }
//        }
//    }

    func fetchCarsData(completion: @escaping (Result<[Car], Error>) -> Void) {
        let url = "https://mocki.io/v1/89331fe5-1826-4829-a5c7-7c4fadcc9b3d" // Replace with your actual API URL

        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    // Decode the data
                    let decoder = JSONDecoder()
                    let carList = try decoder.decode(CarList.self, from: data)
                    
                    // Return the car list via completion handler
                    completion(.success(carList.cars))
                } catch let decodingError {
                    // Handle decoding error
                    completion(.failure(decodingError))
                }
            case .failure(let error):
                // Handle networking error
                completion(.failure(error))
            }
        }
    }

    // Method to return the count of cars
    func getCarCount() -> Int {
        return cars.count
    }

    // Method to get a specific car by index
    func getCar(at index: Int) -> Car? {
        guard index >= 0 && index < cars.count else { return nil }
        return cars[index]
    }

    // You can add more methods to manipulate car data as needed, e.g. filter by brand, etc.
    func getCarImage(id: Int) -> String? {
        if let car = cars.first(where: { $0.id == id }) {
                // Assuming you have a way to get the UIImage for the car
            let imageConvert = car.images[0]
            return imageConvert
        }
        return nil
    }

    func getCarBrand(id: Int) -> String? {
        if let car = cars.first(where: { $0.id == id }) {
            return car.brand
        }
        return nil
    }

    func getCarModel(id: Int) -> String? {
        if let car = cars.first(where: { $0.id == id }) {
            return car.model
        }
        return nil
    }

    func getCarYear(id: Int) -> String? {
        if let car = cars.first(where: { $0.id == id }) {
            return String(car.year)
        }
        return nil
    }

    func getCarPrice(id: Int) -> String? {
        if let car = cars.first(where: { $0.id == id }) {
            return String(car.price)
        }
        return nil
    }

    func getCarLocation(id: Int) -> String? {
        if let car = cars.first(where: { $0.id == id }) {
            return car.location
        }
        return nil
    }

    func getCarType(id: Int) -> String? {
        if let car = cars.first(where: { $0.id == id }) {
            return car.type
        }
        return nil
    }

}
