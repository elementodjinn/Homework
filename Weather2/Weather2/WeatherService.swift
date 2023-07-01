//
//  WeatherService.swift
//  Weather2
//
//  Created by apple on 6/25/23.
//

import Foundation
import Combine

enum APIError: Error{
    case InvalidURL
    case InvalidResponse
}

class WeatherService{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?"
    let geoURL = "https://api.openweathermap.org/geo/1.0/direct?"
    let APIKey = "&appid=0c027e77b528733ce5feb753ccfda4d5"
    func fetchWeatherAsync(_ lat : Double, _ lon : Double) async throws -> WeatherData{
        let newURL = weatherURL + "lat=\(lat)&lon=\(lon)\(APIKey)&units=imperial"
        guard let url = URL(string: newURL) else {throw APIError.InvalidURL}
        let (data, response) = try await URLSession.shared.data(from:url)
        guard let r = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= r else{throw APIError.InvalidResponse}
        return try JSONDecoder().decode(WeatherData.self, from: data)
    }
    func fetchCityAsync(_ cityName: String) async throws -> [GeoCode]{
        let newURL = geoURL + "q=\(cityName),us\(APIKey)"
        guard let url = URL(string: newURL) else {throw APIError.InvalidURL}
        let (data, response) = try await URLSession.shared.data(from:url)
        guard let r = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= r else{throw APIError.InvalidResponse}
        return try JSONDecoder().decode([GeoCode].self, from: data)
    }
}
