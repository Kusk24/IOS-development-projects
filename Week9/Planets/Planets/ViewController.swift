//
//  ViewController.swift
//  Planets
//
//  Created by Win Yu Maung on 24/08/2024.
//

import UIKit

class ViewController: UIViewController {

    var planet: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        planet.append("Earth")
        planet.append("Mars")
        planet.append("Venus")
        planet.append("Saturn")
        planet.append("Jupiter")
        planet.append("Mercury")
        planet.append("Uranus")
        planet.append("Nepturn")
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let itemIndex = indexPath.item
        
//        let cellId = bools[itemIndex] ? "cell1" : "cell2"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell" , for: indexPath) as! PlanetCell
        
        cell.planetimage.image = UIImage(named: planet[itemIndex])
        cell.planetname.text = planet[itemIndex]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        
        detail.name = planet[indexPath.item]
        
        detail.modalPresentationStyle = .popover
        present(detail, animated: true, completion: nil)
    }
}

