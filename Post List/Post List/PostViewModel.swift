//
//  Post Service.swift
//  Post List
//
//  Created by apple on 6/23/23.
//

import Foundation
import Combine


class PostViewModel : ObservableObject{
    @Published var posts : [Int:[Post]] = [:]
    var cancellable = Set<AnyCancellable>()
    var service = PostService()
//    func fetch
//    guard let url = URL else throw error
//    let data response = try awaint urlsession.shared.data(from:url)
//    gurad let resp = response as? httpurlresponse,
//    resp.statusCode == 200 else {throw}
//    return try JSONDecoder().decode([Post].self, data)
//
    @MainActor func getPostAsync() {
        Task{
            do{
                let postArray = try await service.fetchPostAsync()
                posts = reformatPosts(postArray)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    @MainActor func addPost() {
        Task{
            do{
                let post: Post = try await service.addPost(Post(userId:1, id: 11, title: "help", body: "why"))
                print("Post: \(post)")
            } catch {
                print (error.localizedDescription)
            }
        }
    }
    
    func reformatPosts(_ posts: [Post]) -> [Int:[Post]]{
        var result : [Int:[Post]] = [:]
        for p in posts {
            if result.keys.contains(p.userId) {
                result[p.userId]?.append(p)
            }
            else {
                result[p.userId] = [p]
            }
        }
        return result
    }
//
//    func useAsyncAwait you can also signify this through the key word async
//    Task{ means the stuff in the brackets will run asynchronously
//    do{let posts: [post] = try await fetchpostsusingasyncawait()
//    sectionposts = self.processPosts(posts)
//    catch if let error = error as Api error
}
