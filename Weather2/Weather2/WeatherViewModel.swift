//
//  WeatherViewModel.swift
//  Weather2
//
//  Created by apple on 6/25/23.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather : WeatherData = WeatherData()
    @Published var city : [GeoCode] = []
    
    var service = WeatherService()
    @MainActor func getWeatherAsync(_ lat: Double, _ lon: Double){
        Task {
            do{
                let w = try await service.fetchWeatherAsync(lat, lon)
                weather = w
            } catch {
                print(error.self)
            }
        }
    }
    @MainActor func getCityAsync(_ cityName: String){
        Task {
            do{
                let c = try await service.fetchCityAsync(cityName.replacingOccurrences(of: " ", with: "_"))
                city = c
                getWeatherAsync(c[0].lat,c[0].lon)
                print(c)
            } catch {
                print("a")
                print(error.localizedDescription)
            }
        }
    }
    
}
