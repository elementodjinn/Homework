//
//  StockService.swift
//  CashStocksApp
//
//  Created by apple on 7/14/23.
//

import Foundation

enum APIError: Error{
    case InvalidURL
    case InvalidResponse
}

protocol StockServiceProtocol {
    func fetchStocks() async throws -> [Stock]
}



class StockService : StockServiceProtocol {
    let stockUrlString = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json"
    
    func fetchStocks() async throws -> [Stock] {
        
        guard let url = URL(string:stockUrlString) else {
            throw APIError.InvalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let r = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= r else{throw APIError.InvalidResponse}
        
        do {
            let result = try JSONDecoder().decode(StockResponse.self, from: data)
            return result.stocks
        } catch {
            throw error
        }
    }
}
