//
//  WeatherData.swift
//  Weather2
//
//  Created by apple on 6/25/23.
//

import Foundation

struct WeatherData: Codable, Hashable{
    var coord : Coordinates = Coordinates()
    var weather : [Weather] = []
    var main : Main = Main()
    var dt : CLong = 0
    var timezone : Int = 0
    var name : String = ""
}

struct Coordinates: Codable, Hashable{
    var lon : Double = 0
    var lat : Double = 0
}

struct Weather: Codable, Hashable{
    var id: Int = 0
    var main : String = ""
    var description: String = ""
    var icon : String = ""
}

struct Main: Codable, Hashable{
    var temp : Double = 0
    var feels_like : Double = 0
    var temp_min : Double = 0
    var temp_max: Double = 0
}

struct GeoCode: Codable, Hashable{
    var name : String = ""
    var lat: Double = 0
    var lon: Double = 0
}
