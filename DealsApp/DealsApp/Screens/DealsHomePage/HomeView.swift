//
//  ContentView.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        VStack {
            NavigationView {
                ScrollView{
                    VStack{
                        ForEach(viewModel.deals){ deal in
                            
                            DealPreview(deal: deal)
                            Divider()
                        }
                    }
                }
                .navigationTitle("Deals")
            }
            
        }
        .padding()
        .onAppear(perform: viewModel.getDeals)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
