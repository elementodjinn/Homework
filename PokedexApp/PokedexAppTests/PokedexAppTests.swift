//
//  PokedexAppTests.swift
//  PokedexAppTests
//
//  Created by apple on 8/9/23.
//

import XCTest
@testable import PokedexApp

final class PokedexAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGoodURL() {
        let exp = XCTestExpectation(description: "Expecting successful test")
        let service = PokemonService()
        
        Task {
            do {
                let myPokemon = try await service.fetchPokemonList()
                XCTAssertEqual(myPokemon[0].name, "bulbasaur")
                print("testGoodURL(): Success")
                exp.fulfill()
            } catch {
                print(error)
                
            }
        }
        
        wait(for: [exp], timeout: 5.0)
    }

}
