//
//  DealsResponse.swift
//  DealsApp
//
//  Created by apple on 7/3/23.
//

import Foundation

struct DealsResponse: Codable {
    let data : Deals
}

struct Deals :Codable {
    let deals : [Deal]
}

struct Deal: Codable, Hashable {
    static func == (lhs: Deal, rhs: Deal) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher){
        hasher.combine(id)
    }
    
    var id : String
    let title: String
    let url: String
    let price: Int
    let description: String
    let createdAt : String
    let updatedAt: String
    let product: Product
    let likes: [Like]
    let dislikes: [Dislike]
    let comments: [Comment]
}

struct Product : Codable {
    let availability : String
    let image : String
    let description : String
}
struct Like : Codable {
    let id: String
    let user: User
}
struct Dislike : Codable {
    let id: String
    let user: NameUser
}
struct Comment : Codable, Identifiable {
    let id: String
    let createdAt: String
    let text: String
    let user: NameUser
}
struct User : Codable {
    let name: String
    let likes : [LikedDeals]
}

struct NameUser: Codable{
    let name:String
}

struct LikedDeals: Codable{
    let id: String
    let deal: TruncDeal
}

struct TruncDeal: Codable{
    let id : String
}

