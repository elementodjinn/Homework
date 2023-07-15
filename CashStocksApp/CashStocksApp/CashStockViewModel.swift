//
//  CashStockViewModel.swift
//  CashStocksApp
//
//  Created by apple on 7/14/23.
//

import Foundation

enum State{
    case initial, loading, loaded, error
}
class CashStockViewModel : ObservableObject {
    let stockService : StockServiceProtocol
    init(stockService: StockServiceProtocol = StockService()) {
        self.stockService = stockService
    }
    
    @Published var stocks : [Stock] = []
    @Published var status : State = State.initial
    
    
    @MainActor func getStocks() {
        status = State.loading
        Task{
            do {
                stocks = try await stockService.fetchStocks()
                status = State.loaded
            } catch {
                status = State.error
                print(error.self)
            }
        }
    }
}
