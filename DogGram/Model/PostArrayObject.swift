//
//  PostArrayObject.swift
//  DogGram
//
//  Created by Robert Basamac on 17.11.2022.
//

import Foundation

class PostArrayObject: ObservableObject {
    @Published var dataArray: [PostModel] = []
    
    init() {
        let post1 = PostModel(postID: "", userID: "", username: "Zenitsu", caption: "Caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post2 = PostModel(postID: "", userID: "", username: "Marian", caption: nil, dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post3 = PostModel(postID: "", userID: "", username: "Robert", caption: "Test caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post4 = PostModel(postID: "", userID: "", username: "Basamac", caption: nil, dateCreated: Date(), likeCount: 0, likedByUser: false)
        
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
    }
}
