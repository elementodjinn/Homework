//
//  ContentView.swift
//  Post List
//
//  Created by apple on 6/23/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PostService()
    var body: some View {
        VStack {
            Text("All Posts")
                .font(.title)
            List(viewModel.posts) {post in
                PostCell(post:post)
                    .background(.white)
            }
            
        }
        .onAppear{
            viewModel.fetchPosts()}
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
