//
//  ContentView.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var path = NavigationPath()
    var body: some View {
        VStack {
            NavigationStack(path: $path) {
                ScrollView{
                    VStack{
                        ForEach(viewModel.deals, id:\.self){ deal in
                            NavigationLink(value:deal){
                                DealPreview(deal: deal)
                            }
                            Divider()
                        }
                    }
                }
                .navigationTitle("Deals")
                .navigationDestination(for: Deal.self){deal in
                    DealView(deal: deal, deals: viewModel.deals, path: $path)
                }
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
