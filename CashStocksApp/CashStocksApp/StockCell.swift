//
//  StockCell.swift
//  CashStocksApp
//
//  Created by apple on 7/15/23.
//

import Foundation
import SwiftUI

struct StockCell: View {
    var stock : Stock
    var body: some View {
        let price = Double(Double(stock.current_price_cents)/100)
        let priceString = String(format: "%.2f", price)
        let quant = stock.quantity ?? 0
            HStack{
                VStack{
                    Text("\(stock.name)")
                        .font(.system(size: 30))
                    .fontWeight(.semibold)
                    Text("\(stock.ticker)")
                }
                VStack{
                    let timeString = timeFormat(time:Date(timeIntervalSince1970: TimeInterval(stock.current_price_timestamp)))
                    Text("As of \(timeString)")
                        .font(.system(size: 10))
                    Text("\(priceString) \(stock.currency)")
                        .font(.system(size: 20))
                    Spacer()
                    Text("\(quant) left")
                        .font(.system(size: 15))
                }
            }
        .padding()
        .frame(width: 350.0)
        .overlay{
            RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 5)
        }
        .background(.white.opacity(0.75))
        .cornerRadius(15)
    }
}

func timeFormat(time: Date)->String{
    let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
    return formatter.string(from:time)
}
