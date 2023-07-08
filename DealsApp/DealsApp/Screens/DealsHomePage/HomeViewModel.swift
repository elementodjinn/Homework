//
//  HomeViewModel.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    // Call the fetch call using DealsService
    
    let dealsService = DealsService()
    
    @Published var deals : [Deal] = []
    @Published var test : Int = 0
    
    func getDeals() {
        do {
            deals = try dealsService.fetchDeals()
            test = 1
        } catch {
            print(error.self)
        }
    }
}
