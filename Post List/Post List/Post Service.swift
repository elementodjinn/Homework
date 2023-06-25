//
//  Post Service.swift
//  Post List
//
//  Created by apple on 6/23/23.
//

import Foundation
import Combine


enum APIError: Error{
    case invalidUrl
    case invalidResponse
}
class PostService{
    var posts : [Post] = []
    var cancellable = Set<AnyCancellable>()
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    //the return for the guard let should probably be a throw
    func fetchPosts(){
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
    func fetchPostAsync() async throws -> [Post]{
        guard let url = URL(string:urlString) else {throw APIError.invalidUrl}
        let (data, response) = try await URLSession.shared.data(from:url)
        guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else {throw APIError.invalidResponse }
        return try JSONDecoder().decode([Post].self, from: data)
    }
    
    func addPost(_ postData: Post) async throws -> Post
    {
        guard let url = URL(string: urlString) else {throw APIError.invalidUrl}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(postData)
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        let (data, response) = try await URLSession.shared.data(for:request)
        
        guard(response as? HTTPURLResponse)?.statusCode == 200 else{
            throw APIError.invalidResponse
        }
        if let responseString = String(data: data, encoding: .utf8){
            print("Response: \(responseString)")
        }
        return try JSONDecoder().decode(Post.self, from: data)
    }
//    guard let url = URL else throw error
//    let data response = try awaint urlsession.shared.data(from:url)
//    gurad let resp = response as? httpurlresponse,
//    resp.statusCode == 200 else {throw}
//    return try JSONDecoder().decode([Post].self, data)
//
//    @MainActor
//
//    func useAsyncAwait you can also signify this through the key word async
//    Task{ means the stuff in the brackets will run asynchronously
//    do{let posts: [post] = try await fetchpostsusingasyncawait()
//    sectionposts = self.processPosts(posts)
//    catch if let error = error as Api error
}
