//
//  PostModel.swift
//  DogGram
//
//  Created by Robert Basamac on 17.11.2022.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable {
    var id: UUID = UUID()
    var postID: String      // ID for the post in Database
    var userID: String      // ID for the user in Database
    var username: String    // Username for user in Database
    var caption: String?
    var dateCreated: Date
    var likeCount: Int
    var likedByUser: Bool
}

extension PostModel: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
