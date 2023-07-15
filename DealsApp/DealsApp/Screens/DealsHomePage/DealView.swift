//
//  DealView.swift
//  DealsApp
//
//  Created by apple on 7/5/23.
//

import Foundation
import SwiftUI

struct DealView : View{
    var deal : Deal
    var deals: [Deal]
    @Binding var path : NavigationPath
    
    
    
    var body : some View {
        let priceString = String(format: "%.2f", Double(deal.price)/100)
        ScrollView{
            VStack(alignment: .center){
                Text("\(deal.title)")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                AsyncImage(url:URL(string: urlTranslate(deal.product.image))) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                } placeholder: {
                    Image(systemName:"photo")
                }
                Text("\(deal.product.availability)")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                Text("$\(priceString)")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                HStack{
                    Spacer()
                    Image(systemName: "hand.thumbsup.fill")
                    Text("\(deal.likes.count)")
                    Spacer()
                    Image(systemName: "hand.thumbsdown.fill")
                    Text("\(deal.dislikes.count)")
                    Spacer()
                }
                Text("Product Description")
                ScrollView{
                    Text("\(deal.product.description)")
                }
                .frame(height: 100)
                commentsView
                Text("People who liked this also liked...")
                    .fontWeight(.bold)
                ScrollView(.horizontal){
                    HStack{
                        ForEach(likedDeals(deal:deal, deals: deals), id: \.self){d in
                            NavigationLink(value: d){
                                DealMiniView(deal:d)
                            }
                        }
                    }
                }
            }
        }
    }
    var commentsView : some View {
        Group{
            Text("Comments")
                .fontWeight(.bold)
            List{
                ForEach(deal.comments){ comment in
                    let timeString = timeFormat(time:comment.createdAt)
                    HStack(alignment: .top){
                        VStack(alignment: .center){
                            Image(systemName: "person.circle")
                            Text("\(comment.user.name)")
                            Text("\(timeString)")
                        }
                        Text("\(comment.text)")
                    }
                }
            }
            .frame(maxHeight: 150)
        }
    }
}
func timeFormat(time: String)->String{
    let formatter = DateFormatter()
    formatter.dateStyle = DateFormatter.Style.short
    let timeInt = Int(time) ?? 0
    return formatter.string(from:Date(timeIntervalSince1970: TimeInterval(timeInt)))
}

func likedDeals(deal: Deal, deals: [Deal])-> [Deal]{
    var likedDeals : Set<Deal> = []
    for like in deal.likes {
        for otherLike in like.user.likes{
            if(otherLike.deal.id != deal.id){
                for d in deals{
                    if(d.id == otherLike.deal.id ){
                        likedDeals.insert(d)
                        break
                    }
                }
            }
        }
    }
    return Array(likedDeals)
}

