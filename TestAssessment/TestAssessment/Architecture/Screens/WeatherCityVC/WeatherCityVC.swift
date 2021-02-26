//
//  WeatherCityVC.swift
//  TestAssessment
//
//  Created by Hitesh on 26/02/21.
//

import UIKit

class WeatherCityVC: UIViewController {
    
    @IBOutlet weak var textFieldCity: UITextField!
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func validate() -> Bool {
        let city = textFieldCity.text?.trimmingCharacters(in: .whitespaces) ?? ""
        
        if city.isEmpty {
            return false
        }
        return true
    }
    
    @IBAction func onBtnLookupAction(_ sender: Any) {
        if validate() == false {
            return
        }
        self.view.endEditing(true)
        performSegue(withIdentifier: UIStoryboardSegue.cityList, sender: nil)
    }
    
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == UIStoryboardSegue.cityList, let vc = segue.destination as? WeatherCityListVC {
            vc.cityName = textFieldCity.text?.trimmingCharacters(in: .whitespaces) ?? ""
        }
    }
    

}
