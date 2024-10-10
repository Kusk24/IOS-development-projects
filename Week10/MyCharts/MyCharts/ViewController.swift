//
//  ViewController.swift
//  MyCharts
//
//  Created by Win Yu Maung on 07/09/2024.
//

import UIKit
import DGCharts

class ViewController: UIViewController {
    @IBOutlet weak var Line: LineChartView!
    @IBOutlet weak var Bar: BarChartView!
    @IBOutlet weak var Pie: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLineChart()
        setupBarChart()
        setupPieChart()
    }


    func setupLineChart() {
        var lineChartEntries = [ChartDataEntry]()
        
        let values = [10.00,14.00,12.00,18.00]
        
        for i in 0..<values.count {
            let value = ChartDataEntry(x: Double(i), y: values[i])
            lineChartEntries.append(value)
        }
        
        let lineDataSet = LineChartDataSet(entries: lineChartEntries, label: "Prices")
        let lineData = LineChartData(dataSet: lineDataSet)
        
        Line.data = lineData
    }

    
    func setupBarChart() {
        var barChartEntries = [BarChartDataEntry]()

        let values = [10.00, 14.00, 12.00, 18.00]
        
        for i in 0..<values.count {
            let value = BarChartDataEntry(x: Double(i), y: values[i])
            barChartEntries.append(value)
        }
        
        let barDataSet = BarChartDataSet(entries: barChartEntries, label: "Prices")
        let barData = BarChartData(dataSet: barDataSet)
        
        Bar.data = barData
    }

    func setupPieChart() {
        var pieChartEntries = [PieChartDataEntry]()
        
        let categories = ["John", "Jack", "James", "Joy"]
        let values = [40.0,30.0,15.0,15.0]
        let mycolor = [#colorLiteral(red: 0.01890037581, green: 0, blue: 0.9930624366, alpha: 1), #colorLiteral(red: 0.01138263568, green: 0.9990257621, blue: 0.0006006201729, alpha: 1), #colorLiteral(red: 0.9959189296, green: 0.002573471982, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.5022640228, blue: 0.00480267778, alpha: 1) ]
        for i in 0..<categories.count {
            let entry = PieChartDataEntry(value: values[i], label: categories[i])
            pieChartEntries.append(entry)
        }
        
        let pieDataSet = PieChartDataSet(entries: pieChartEntries)
        pieDataSet.colors = mycolor
        let pieData = PieChartData(dataSet: pieDataSet)
        
        
        
        Pie.data = pieData
    }

}

