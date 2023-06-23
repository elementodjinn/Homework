//
//  Post.swift
//  Post List
//
//  Created by apple on 6/23/23.
//

import Foundation

struct Post : Identifiable, Decodable{
    let userId : Int
    let id : Int
    let title : String
    let body : String
}
