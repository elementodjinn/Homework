//
//  StockResponse.swift
//  CashStocksApp
//
//  Created by apple on 7/14/23.
//

import Foundation

struct StockResponse : Codable {
    let stocks : [Stock]
}

struct Stock : Codable, Hashable{
    let ticker : String
    let name : String
    let currency : String
    let current_price_cents : Int
    let quantity : Int?
    let current_price_timestamp : CLong
}
