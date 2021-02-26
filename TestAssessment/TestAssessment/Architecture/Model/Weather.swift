//
//  Weather.swift
//  TestAssessment
//
//  Created by Hitesh on 26/02/21.
//

import Foundation

// MARK: - WeatherData
struct WeatherData: Codable {
    let cod, message : String
    let cnt: Int?
    let list: [WeatherList]?
    let city: City?
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}
// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: - List
struct WeatherList: Codable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
//    let visibility, pop: Int
    let sys: Sys
    let dt_txt: String

    
//    enum CodingKeys: String, CodingKey {
//        case dt, main, weather, clouds, wind, visibility, pop, sys
//        case dtTxt = "dt_txt"
//    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
//    let tempKf: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
//        case tempKf = "temp_kf"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            temp = try container.decode(Double.self, forKey: .temp)
        } catch DecodingError.typeMismatch {
            temp = try Double(container.decode(String.self, forKey: .temp)) ?? 0
        }
        do {
            feelsLike = try container.decode(Double.self, forKey: .feelsLike)
        } catch DecodingError.typeMismatch {
            feelsLike = try Double(container.decode(String.self, forKey: .feelsLike)) ?? 0
        }
        do {
            tempMin = try container.decode(Double.self, forKey: .tempMin)
        } catch DecodingError.typeMismatch {
            tempMin = try Double(container.decode(String.self, forKey: .tempMin)) ?? 0
        }
        do {
            tempMax = try container.decode(Double.self, forKey: .tempMax)
        } catch DecodingError.typeMismatch {
            tempMax = try Double(container.decode(String.self, forKey: .tempMax)) ?? 0
        }
        pressure = try container.decode(Int.self, forKey: .pressure)
        seaLevel = try container.decode(Int.self, forKey: .seaLevel)
        grndLevel = try container.decode(Int.self, forKey: .grndLevel)
        humidity = try container.decode(Int.self, forKey: .humidity)
    }

}

// MARK: - Sys
struct Sys: Codable {
    let pod: String
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
//        case icon
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            id = try container.decode(Int.self, forKey: .id)
        } catch DecodingError.typeMismatch {
            id = try Int(container.decode(String.self, forKey: .id)) ?? 0
        }
        
        main = try container.decode(String.self, forKey: .main)
        weatherDescription = try container.decode(String.self, forKey: .weatherDescription)

    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}

