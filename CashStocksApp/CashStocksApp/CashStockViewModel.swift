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
final class CashStockViewModel : ObservableObject {
    let stockService : StockServiceProtocol
    
    @Published var stocks : [Stock] = []
    @Published var status : State = State.initial
    
    init(service: StockServiceProtocol = StockService()) {
        self.stockService = service
        Task {
            await getStocks()
        }
    }
    
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

class MockStockService: StockServiceProtocol {
    func fetchStocks() async throws -> [Stock] {
        guard let url = Bundle(for: type(of: self)).url(forResource: "portfolio", withExtension: "json") else {
        throw APIError.InvalidURL
        }
        
        let data = try! Data(contentsOf: url)
        
        do {
            let result = try JSONDecoder().decode(StockResponse.self, from: data)
            return result.stocks
        } catch {
            return []
        }
    }
}
