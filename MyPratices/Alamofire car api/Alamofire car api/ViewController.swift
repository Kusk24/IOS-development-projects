//
//  ViewController.swift
//  Alamofire car api
//
//  Created by Win Yu Maung on 23/09/2024.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var MyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        CarViewModel.shared.fetchCarsData{ result in
            switch result {
            case .success(let cars):
                // Do something with the list of cars
                print("Fetched cars: \(cars)")
            case .failure(let error):
                // Handle error
                print("Error fetching cars: \(error)")
            }
        }
        
        if let imageURL = URL(string: "https://www.dropbox.com/scl/fi/z0dtbaag8wpksksrg80iq/2016_Honda_Jazz_-GK5_MY16-_VTi_hatchback_-2018-09-17-_01.jpg?rlkey=tbx4ktpq9u8pdjephxuq11vwz&st=amukwf4y&raw=1") {
            MyImage.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder.png"))
        }
    }
}

