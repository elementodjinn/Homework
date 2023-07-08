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

struct Deal: Codable, Identifiable {
    let id : String
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
    let user: User
}
struct Comment : Codable, Identifiable {
    let id: String
    let createdAt: String
    let text: String
    let user: User
}
struct User : Codable {
    let name: String
}

