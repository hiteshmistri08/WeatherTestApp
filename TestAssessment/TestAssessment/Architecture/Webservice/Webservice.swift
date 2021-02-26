//
//  Webservice.swift
//  TestAssessment
//
//  Created by Hitesh on 26/02/21.
//

import Foundation
//API: https://api.openweathermap.org/data/2.5/forecast?q={city}&appid={api key}

fileprivate let WeatherAPIKey = "8defe581b561d6753674ff1c281b51a8"

// Server
let BaseURL = "https://api.openweathermap.org/data/2.5/"

struct ServerEndPoint {
    private init() {}
    static let weather = BaseURL + "forecast?appid=\(WeatherAPIKey)"
}


struct Webservice {
    private init() {}
    static func get(url:URL,completion:@escaping(Data?, URLResponse?, Error?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: completion)
        dataTask.resume()
    }
}
