//
//  CommentModel.swift
//  DogGram
//
//  Created by Robert Basamac on 17.11.2022.
//

import Foundation
import SwiftUI

struct CommentModel: Identifiable {
    var id: UUID = UUID()
    var commentID: String       // ID for the comment in the Database
    var userID: String          // ID for the user in the Database
    var username: String        // Username for the user in the Database
    var content: String         // The comment text
    var dateCreated: Date
}

extension CommentModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
