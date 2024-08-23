//
//  FavouriteViewController.swift
//  Restaurant Finder
//
//  Created by Kiratijuta Bhumichitr on 10/8/2567 BE.
//

import UIKit

class FavouriteViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var restaurants: [Restaurant] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let result = readJSONFile(named: "Restaurants", withExtension: "json") {
            restaurants = result.restaurants
            restaurants = restaurants.filter { r in
                FAV_RESTAURANTS.contains { name in r.name == name }
            }
        }
        tableView.reloadData()

    }

    func readJSONFile(named fileName: String, withExtension fileExtension: String) -> RestaurantClass? {
        // Locate the file in the bundle
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                // Read the data from the file
                let data = try Data(contentsOf: fileURL)
                // Decode the data to the AppInfo struct
                let appInfo = try JSONDecoder().decode(RestaurantClass.self, from: data)
                return appInfo
            } catch {
                print("Error reading or decoding file: \(error.localizedDescription)")
            }
        } else {
            print("File not found.")
        }
        return nil
    }

}

extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let i = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantcell") as! RestaurantCell
        let restaurant = restaurants[i] // Make sure 'restaurants' is in scope
        
        // Assuming FAV_RESTAURANTS is an array of Strings containing restaurant names
        if FAV_RESTAURANTS.contains(restaurants[i].name) {
            cell.Heart.image = UIImage(systemName: "heart.fill")
        }else {
            cell.Heart.image = UIImage(systemName: "heart")
        }
        cell.displayName.text = restaurant.name
        cell.displayLocation.text = restaurant.location
        cell.displayRating.text = "\(restaurant.rating)"
        cell.displayTime.text = restaurant.openingTime
        cell.displayPrice.text = restaurant.price
        cell.displayImage.image = UIImage(named: restaurant.images[0])
        cell.displayStars(numberOfRating: restaurant.rating)
        

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailScene = storyboard?.instantiateViewController(identifier: "detailviewcontroller") as! DetailViewController
        detailScene.restaurant = restaurants[indexPath.row]
        
        navigationController?.pushViewController(detailScene, animated: true)
    }
    
}
