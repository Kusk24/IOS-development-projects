//
//  ViewController.swift
//  ExerciseForFinal
//
//  Created by Win Yu Maung on 01/10/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    @IBOutlet weak var SegmentControl: UISegmentedControl!
    @IBOutlet weak var MyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MyTableView.dataSource = self
        MyTableView.delegate = self
    }

    @IBAction func SegmentControlClicked(_ sender: Any) {
        
        switch SegmentControl.selectedSegmentIndex {
        case 0:
            print("This is 0")
        case 1:
            print("This is 1")
        default:
            break
        }
    }
    
}

