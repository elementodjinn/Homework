//
//  Post Cell.swift
//  Post List
//
//  Created by apple on 6/23/23.
//

import SwiftUI

struct PostCell: View {
    let post : Post
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading){
                Text(String(post.id))
                Text(post.title)
                Text(post.body)
            }
            Spacer()
        }
        .padding()
        .background(Color(.lightGray))
        .cornerRadius(15)
    }
}
