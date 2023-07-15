//
//  CashStocksAppTests.swift
//  CashStocksAppTests
//
//  Created by apple on 7/14/23.
//

import XCTest
import Combine
@testable import CashStocksApp

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
            throw error
        }
    }
}

final class CashStocksAppTests: XCTestCase {
    
    let failureStock = Stock(ticker: "", name: "", currency: "", current_price_cents: 0, quantity: 0, current_price_timestamp: 0)
    var anyCancellable = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        anyCancellable = []
    }

    //Should Return Stocks
    func test_getStocks_success() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let exp = XCTestExpectation(description: "Testing Stocks Success")
        let viewModel = CashStockViewModel(stockService: MockStockService())
        await viewModel.getStocks()
        viewModel.$stocks
            .sink{stocks in
                if let stock = stocks.first {
                    XCTAssertEqual(stock.ticker, "^GSPC")
                    exp.fulfill()
                }
            }
            .store(in: &anyCancellable)
        
        wait(for: [exp], timeout: 30.0)
        
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
