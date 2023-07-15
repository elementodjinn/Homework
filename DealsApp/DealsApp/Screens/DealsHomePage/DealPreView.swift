//
//  DealPreView.swift
//  DealsApp
//
//  Created by apple on 7/7/23.
//

import Foundation
import SwiftUI

struct DealPreview : View{
    var deal : Deal
    var body : some View {
        
        let priceString = String(format: "%.2f", Double(deal.price)/100)
        HStack{
            AsyncImage(url:URL(string: urlTranslate(deal.product.image))) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
            } placeholder: {
                Image(systemName:"photo")
            }
            VStack{
                HStack{
                    Text("\(deal.title)")
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                    Spacer()
                    Text("$\(priceString)")
                }
                .padding()
                Text("\(deal.description)")
                    .font(.system(size: 10))
            }
        }
    }
}

func urlTranslate (_ url : String) -> String
{
    return url.replacingOccurrences(of: "http:", with: "https:")
}
