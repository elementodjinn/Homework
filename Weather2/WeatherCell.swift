//
//  WeatherCell.swift
//  Weather2
//
//  Created by apple on 6/25/23.
//

import SwiftUI

struct WeatherCell: View {
    var weatherData : WeatherData
    var geoCode : GeoCode
    var body: some View {
        let tempString = String(format: "%.2f", weatherData.main.temp)
        let highString = String(format: "%.2f", weatherData.main.temp_max)
        let lowString = String(format: "%.2f", weatherData.main.temp_min)
        VStack{
            Text("\(geoCode.name)")
                .font(.system(size: 30))
                .fontWeight(.semibold)
            HStack{
                VStack{
                    //Text("\(geoCode.name)")
                    let timeString = timeFormat(time:Date(timeIntervalSince1970: TimeInterval(weatherData.dt + weatherData.timezone)))
                    Text("\(timeString)")
                        .font(.system(size: 20))
                }
                Spacer()
                Text("\(tempString)°")
                    .font(.system(size: 20))
            }
            HStack{
                if(!weatherData.weather.isEmpty){
                    let w = weatherData.weather[0]
                    Text("\(w.description)")
                        .font(.system(size: 15))
                    AsyncImage(url: URL(string: "https://openweathermap.org/img/wn//\(w.icon)@2x.png")){image in
                        image
                            .resizable()
                            .frame(width:30,height:30)
                        
                    } placeholder: {
                        Image(systemName: "photo")
                    }
                }
                Spacer()
                Text("H: \(highString)° L: \(lowString)°")
                    .font(.system(size: 15))
            }
        }
        .padding()
        .frame(width: 350.0)
        .overlay{
            RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 5)
        }
        .background(.white.opacity(0.5))
        .cornerRadius(15)
    }
}

func timeFormat(time: Date)->String{
    let formatter = DateFormatter()
        formatter.timeStyle = DateFormatter.Style.short
    return formatter.string(from:time)
}

//struct WeatherCell_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherCell()
//    }
//}
