//
//  ContentView.swift
//  Post List
//
//  Created by apple on 6/23/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PostViewModel()
    var body: some View {
        VStack {
            Text("All Posts")
                .font(.title)
            List{
                ForEach(Array(viewModel.posts.keys).sorted(by: <), id: \.self){ info in
                    Section(header: Text("\(info)")){
                        ForEach(viewModel.posts[info] ?? []){post in
                            PostCell(post: post)
                        }
                    }
                    
                }
            }
//            List(viewModel.posts) {post in
//                PostCell(post:post)
//                    .background(.white)
//            }
            
        }
        .onAppear{
            viewModel.getPostAsync()}
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
