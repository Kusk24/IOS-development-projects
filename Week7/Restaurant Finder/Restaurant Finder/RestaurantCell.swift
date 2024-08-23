//
//  RestaurantCell.swift
//  Restaurant Finder
//
//  Created by Kiratijuta Bhumichitr on 10/8/2567 BE.
//

import UIKit

class RestaurantCell: UITableViewCell {
    
    @IBOutlet weak var Heart: UIImageView!
    @IBOutlet var displayImage: UIImageView!
    
    @IBOutlet var displayName: UILabel!
    @IBOutlet var displayLocation: UILabel!
    @IBOutlet var displayRating: UILabel!
    @IBOutlet var displayTime: UILabel!
    @IBOutlet var displayPrice: UILabel!
    @IBOutlet var start1: UIImageView!
    @IBOutlet var start2: UIImageView!
    @IBOutlet var start3: UIImageView!
    @IBOutlet var start4: UIImageView!
    @IBOutlet var start5: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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

}
