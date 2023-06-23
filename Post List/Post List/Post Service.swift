//
//  Post Service.swift
//  Post List
//
//  Created by apple on 6/23/23.
//

import Foundation
import Combine

class PostService : ObservableObject{
    @Published var posts : [Post] = []
    var cancellable = Set<AnyCancellable>()
    //the return for the guard let should probably be a throw
    func fetchPosts(){
            let urlString = "https://jsonplaceholder.typicode.com/posts"
            guard let url = URL(string:urlString) else {return}
            URLSession.shared.dataTaskPublisher(for: url)
                .map{$0.data}
                .decode(type: [Post].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink{completion in
                    switch completion{
                    case .finished :
                        break
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }receiveValue: {response in
                    self.posts = response
                }
                .store(in: &self.cancellable)
    }
}
