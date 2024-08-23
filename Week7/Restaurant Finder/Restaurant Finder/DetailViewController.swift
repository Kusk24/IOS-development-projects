//
//  DetailViewController.swift
//  Restaurant Finder
//
//  Created by Kiratijuta Bhumichitr on 10/8/2567 BE.
//

import UIKit

var FAV_RESTAURANTS: [String] = []

class DetailViewController: UIViewController {
    
    var restaurant: Restaurant? = nil

    @IBOutlet var displayImage: UIImageView!
    @IBOutlet var displayName: UILabel!
    @IBOutlet var displayLocation: UILabel!
    @IBOutlet var displayRating: UILabel!
    @IBOutlet var displayTime: UILabel!
    @IBOutlet var displayPrice: UILabel!
    @IBOutlet var displayDescription: UILabel!
    
    @IBOutlet var favoriteButton: UIButton!
    
    @IBOutlet var start1: UIImageView!
    @IBOutlet var start2: UIImageView!
    @IBOutlet var start3: UIImageView!
    @IBOutlet var start4: UIImageView!
    @IBOutlet var start5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let restaurant = restaurant {
            if FAV_RESTAURANTS.contains(restaurant.name) {
                favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)

            }else {
                favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)

            }
            displayName.text = restaurant.name
            displayLocation.text = restaurant.location
            displayRating.text = "\(restaurant.rating)"
            displayTime.text = restaurant.openingTime
            displayPrice.text = restaurant.price
            displayImage.image = UIImage(named: restaurant.images[0])
            displayDescription.text = restaurant.description
            displayStars(numberOfRating: restaurant.rating)

        }
    }
    
    func displayStars(numberOfRating: Double) {
        start1.isHidden = true
        start2.isHidden = true
        start3.isHidden = true
        start4.isHidden = true
        start5.isHidden = true
        
        if numberOfRating >= 1 {
            start1.isHidden = false
        }
        if numberOfRating >= 2 {
            start2.isHidden = false
        }
        if numberOfRating >= 3 {
            start3.isHidden = false
        }
        if numberOfRating >= 4 {
            start4.isHidden = false
        }
        if numberOfRating >= 5 {
            start5.isHidden = false
        }
    }
    
    @IBAction func favoriteClick() {
        if let restaurant = restaurant {
            if let index = FAV_RESTAURANTS.firstIndex(of: restaurant.name) {
                // Restaurant is already a favorite, remove it from the list
                FAV_RESTAURANTS.remove(at: index)
                favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
                print("\(restaurant.name) removed from favorites.")
            } else {
                // Restaurant is not a favorite, add it to the list
                FAV_RESTAURANTS.append(restaurant.name)
                favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                print("\(restaurant.name) added to favorites.")
            }
            
            // Print the current state of FAV_RESTAURANTS
            print("Current favorites: \(FAV_RESTAURANTS)")
        } else {
            print("Restaurant is nil.")
        }
    }
}
