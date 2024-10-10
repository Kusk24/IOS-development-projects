//
//  ViewController.swift
//  CustomChart
//
//  Created by Win Yu Maung on 07/09/2024.
//
import UIKit
import DGCharts

class ViewController: UIViewController {
    @IBOutlet weak var WaterUsage: LineChartView!
    @IBOutlet weak var ElectricityUsage: LineChartView!
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Water Usage Chart
        setupWaterUsageChart()
        
        // Setup Electricity Usage Chart
        setupElectricityUsageChart()
    }
    
    func setupWaterUsageChart() {
        let values: [Double] = [9.0, 10.0, 27.0, 25.0, 1.0, 9.0, 11.0, 10.0]
        let times: [String] = ["6 AM", "7 AM", "8 AM", "9 AM", "10 AM", "11 AM", "12 PM", "Now"]
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<values.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Water Usage")
        configureDataSetAppearance(lineChartDataSet, lineColor: .white)
        
        // Calculate the average value
        let averageValue = values.reduce(0, +) / Double(values.count)
        
        // Create average line dataset
        let averageLineDataSet = createAverageLineDataSet(averageValue: averageValue, xRange: Double(values.count - 1), label: "Avg Water Usage", color: .red)
        
        // Combine the original dataset and average line dataset
        let lineChartData = LineChartData(dataSets: [lineChartDataSet, averageLineDataSet])
        
        WaterUsage.data = lineChartData
        
        configureChartAppearance(chartView: WaterUsage, xAxisValues: times, minY: 0.0, maxY: 30.0, mycolor: #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1))
        
        // Add additional UI elements
        addLabelAboveChart(for: WaterUsage, text: "Water Usage / Daily Average: \(averageValue)", label: Label1)
        addViewDetailsButton(to: WaterUsage, labelText: "View Details")
    }
    
    func setupElectricityUsageChart() {
        let values: [Double] = [40.0, 46.6, 120.0, 121.0, 50.0, 45.0, 45.0, 40.0]
        let times: [String] = ["6 AM", "7 AM", "8 AM", "9 AM", "10 AM", "11 AM", "12 PM", "Now"]
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<values.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }

        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Electricity Usage")
        configureDataSetAppearance(lineChartDataSet, lineColor: .white)
        
        // Calculate the average value
        let averageValue = values.reduce(0, +) / Double(values.count)
        
        // Create average line dataset
        let averageLineDataSet = createAverageLineDataSet(averageValue: averageValue, xRange: Double(values.count - 1), label: "Avg Electricity Usage", color: .red)
        
        // Combine the original dataset and average line dataset
        let lineChartData = LineChartData(dataSets: [lineChartDataSet, averageLineDataSet])
        
        ElectricityUsage.data = lineChartData
        
        configureChartAppearance(chartView: ElectricityUsage, xAxisValues: times, minY: 40.0, maxY: 135.0, mycolor: .systemRed)
        
        // Add additional UI elements
        addLabelAboveChart(for: ElectricityUsage, text: "Electricity Usage / Daily Average: \(averageValue)", label: Label2)
        addViewDetailsButton(to: ElectricityUsage, labelText: "View Details")
    }
    
    func configureDataSetAppearance(_ dataSet: LineChartDataSet, lineColor: UIColor) {
        dataSet.colors = [lineColor]
        dataSet.circleColors = [UIColor.white] // White circle color
        dataSet.circleRadius = 4.0 // Smaller circle radius
        dataSet.circleHoleRadius = 2.0
        dataSet.lineWidth = 2.5
        dataSet.mode = .cubicBezier
        dataSet.drawCirclesEnabled = true
        dataSet.drawValuesEnabled = false // Disable drawing values on the chart

        // Gradient fill
        let gradientColors = [lineColor.withAlphaComponent(0.0).cgColor, lineColor.withAlphaComponent(0.7).cgColor] as CFArray
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors, locations: nil)!
        dataSet.fillAlpha = 0.7
        dataSet.fill = LinearGradientFill(gradient: gradient, angle: 90)
        dataSet.drawFilledEnabled = true // Enable gradient fill
    }
    
    func configureChartAppearance(chartView: LineChartView, xAxisValues: [String], minY: Double, maxY: Double, mycolor: UIColor) {
        chartView.chartDescription.enabled = false
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: xAxisValues)
        chartView.xAxis.granularity = 1
        chartView.leftAxis.axisMinimum = minY
        chartView.leftAxis.axisMaximum = maxY
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.labelTextColor = .white // White text color for Y-axis
        
        chartView.rightAxis.enabled = false // Disable the right Y-axis
        chartView.legend.enabled = false // Disable the legend
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.labelTextColor = .white // White text color for X-axis
        
        chartView.backgroundColor = mycolor.withAlphaComponent(0.7) // Set a similar background color
        chartView.layer.cornerRadius = 10
        chartView.clipsToBounds = true
        
        chartView.animate(xAxisDuration: 2.0)
    }
    
    func createAverageLineDataSet(averageValue: Double, xRange: Double, label: String, color: UIColor) -> LineChartDataSet {
        let averageDataEntry = [ChartDataEntry(x: 0, y: averageValue), ChartDataEntry(x: xRange, y: averageValue)]
        
        let averageLineDataSet = LineChartDataSet(entries: averageDataEntry, label: label)
        averageLineDataSet.colors = [color]
        averageLineDataSet.lineWidth = 2.0
        averageLineDataSet.drawCirclesEnabled = false
        averageLineDataSet.drawValuesEnabled = false
        averageLineDataSet.lineDashLengths = [5, 5] // Dashed line
        averageLineDataSet.valueFont = UIFont.boldSystemFont(ofSize: 14) // Match font size to previous code
        
        return averageLineDataSet
    }
    
    func addViewDetailsButton(to chart: LineChartView, labelText: String) {
        let button = UIButton(type: .system)
        button.setTitle(labelText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false

        chart.addSubview(button)

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: chart.topAnchor, constant: 8),
            button.trailingAnchor.constraint(equalTo: chart.trailingAnchor, constant: -8)
        ])
    }

    func addLabelAboveChart(for chart: LineChartView, text: String, label: UILabel) {
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.backgroundColor = UIColor.white.withAlphaComponent(0.7) // Background color for better contrast
        label.translatesAutoresizingMaskIntoConstraints = false
        
        applyShadow(to: label) // Apply shadow for better readability

        self.view.addSubview(label)

        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: chart.topAnchor, constant: -20), // Adjust spacing as needed
            label.leadingAnchor.constraint(equalTo: chart.leadingAnchor, constant: 8)
        ])
    }
    
    func applyShadow(to label: UILabel) {
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 0, height: 1)
        label.layer.shadowOpacity = 0.7
        label.layer.shadowRadius = 1
    }
    
    func createGradientLayer(for chartView: LineChartView, colors: [UIColor]) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = chartView.bounds
        return gradientLayer
    }
    
    func applyGradient(to chartView: LineChartView, mycolor: UIColor) {
        let gradientColors = [mycolor.withAlphaComponent(0.2), mycolor.withAlphaComponent(0.5)]
        let gradientLayer = createGradientLayer(for: chartView, colors: gradientColors)
        chartView.layer.insertSublayer(gradientLayer, at: 0)
    }
}
    
    


