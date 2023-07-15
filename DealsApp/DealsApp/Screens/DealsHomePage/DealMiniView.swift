//
//  DealMiniView.swift
//  DealsApp
//
//  Created by apple on 7/11/23.
//

import Foundation
import SwiftUI
struct DealMiniView : View{
    var deal : Deal
    var body : some View {
        
        let priceString = String(format: "%.2f", Double(deal.price)/100)
        VStack{
            AsyncImage(url:URL(string: urlTranslate(deal.product.image))) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            } placeholder: {
                Image(systemName:"photo")
            }
            Text("\(deal.title)")
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .lineLimit(3)
            Spacer()
            Text("$\(priceString)")
                .font(.system(size: 20))
                .foregroundColor(.green)
        }
        .padding()
        .frame(width: 160, height: 200)
    }
}
