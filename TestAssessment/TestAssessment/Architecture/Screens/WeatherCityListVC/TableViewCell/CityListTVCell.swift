//
//  CityListTVCell.swift
//  TestAssessment
//
//  Created by Hitesh on 26/02/21.
//

import UIKit

class CityListTVCell: UITableViewCell {

    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblTemperature: UILabel!

    
    static let resueIdentifier = "CityListTVCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ data:WeatherList) {
        lblCityName.text = data.weather.first?.main ?? ""
        lblTemperature.text = "Temp : " + "\(data.main.temp)"
    }

}
