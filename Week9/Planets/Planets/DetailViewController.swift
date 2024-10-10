//
//  DetailViewController.swift
//  Planets
//
//  Created by Win Yu Maung on 24/08/2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    var name: String!
    
    @IBOutlet weak var planetImage: UIImageView!
    @IBOutlet weak var planetName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        planetName.text = name
        planetImage.image = UIImage(named: name)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
