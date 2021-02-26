//
//  WeatherCityListVC.swift
//  TestAssessment
//
//  Created by Hitesh on 26/02/21.
//

import UIKit

class WeatherCityListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cityName = ""
    private var weatherCityData:WeatherData?
    private var weatherList: [WeatherList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = cityName
        setupTableView()
        fetchCities(cityName)
    }
    
    func setupTableView() {
        tableView.estimatedRowHeight = 60.0
        tableView.rowHeight = 60.0
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchCities(_ cityName:String) {
        guard let urlString = (ServerEndPoint.weather + "&q=\(cityName)").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }

        guard let url = URL(string: urlString) else { return }
        debugPrint("Url :- ",url.absoluteURL)

        Webservice.get(url: url) { [weak self] (data, urlResponse, error) in
            if let data = data, error == nil {
                do {
                    let decoder = JSONDecoder()
                    self?.weatherCityData = try decoder.decode(WeatherData.self, from: data)
                    self?.weatherList = self?.weatherCityData?.list
                    
                } catch {
                    debugPrint("\(url) Error is:- ",error.localizedDescription)
                }
                
            }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }

    }
    


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == UIStoryboardSegue.cityDetail, let vc = segue.destination as? WeatherCityDetailVC, let indexPath = tableView.indexPathForSelectedRow {
            vc.setTheModel(weatherList![indexPath.row], cityName)
        }
    }
    

}

//MARK:- UITableViewDataSource
extension WeatherCityListVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityListTVCell.resueIdentifier) as! CityListTVCell
        cell.configureCell(weatherList![indexPath.row])
        return cell
    }
}

//MARK:- UITableViewDelegate
extension WeatherCityListVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: UIStoryboardSegue.cityDetail, sender: nil)
    }
}

