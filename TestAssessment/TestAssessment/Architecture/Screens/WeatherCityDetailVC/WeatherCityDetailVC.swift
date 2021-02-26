//
//  WeatherCityDetailVC.swift
//  TestAssessment
//
//  Created by Hitesh on 26/02/21.
//

import UIKit

class WeatherCityDetailVC: UIViewController {

    @IBOutlet weak var lblTempreture: UILabel!
    @IBOutlet weak var lblFeelsLike: UILabel!
    @IBOutlet weak var lblWeaterStatus: UILabel!
    @IBOutlet weak var lblWeaterDescription: UILabel!

    private var weatherData:WeatherList!
    private var cityName:String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = cityName
        setupUI()
    }
    func setTheModel(_ data:WeatherList, _ cityName:String) {
        weatherData = data
        self.cityName = cityName
    }
    private func setupUI() {
        lblTempreture.text = "\(weatherData.main.temp)"
        lblFeelsLike.text = "Feels Like : \(weatherData.main.feelsLike)"
        lblWeaterStatus.text = weatherData.weather.first?.main
        lblWeaterDescription.text = weatherData.weather.first?.weatherDescription
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
