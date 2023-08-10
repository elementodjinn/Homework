//
//  ContentView.swift
//  CashStocksApp
//
//  Created by apple on 7/14/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CashStockViewModel(service: MockStockService())
    var body: some View {
        VStack {
            Text("STOCKS")
                .font(.system(size: 40))
            switch viewModel.status {
            case State.loading :
                loadingView
            case State.loaded:
                List{
                    ForEach(viewModel.stocks, id: \.self){stock in
                        StockCell(stock:stock)
                    }
                }
            default:
                EmptyView()
            }
        }
        .padding()
    }
    var loadingView : some View {
        Group{
            Image(systemName: "clock")
            Text("Loading")
                .fontWeight(.bold)
            .frame(maxHeight: 150)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
