//
//  ContentView.swift
//  Weather2
//
//  Created by apple on 6/25/23.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    @StateObject var viewModel = WeatherViewModel()
    var body: some View {
        let backGrad = Gradient(colors: [.yellow, .orange, .teal, .blue])
        ZStack{
            VStack {
                Text("Weather")
                    .font(.system(size:40))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                searchField
                ForEach(viewModel.city, id:\.self){c in
                    WeatherCell(weatherData: viewModel.weather,geoCode: c)
                }
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backGrad)
    }
    private var searchField: some View {
        
        TextField("US City", text: $searchText)
            .padding()
            .background(.white.opacity(0.5))
            .cornerRadius(16)
            .padding(.horizontal,16)
            .onSubmit {
                getOne(searchText)
            }
    }
    func getOne(_ search : String){
        let _ = print("you")
        viewModel.getCityAsync(search)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
