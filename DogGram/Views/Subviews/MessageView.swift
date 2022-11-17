//
//  MessageView.swift
//  DogGram
//
//  Created by Robert Basamac on 17.11.2022.
//

import SwiftUI

struct MessageView: View {
    
    @State var comment: CommentModel
    
    var body: some View {
        HStack {
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(comment.username)
                    .font(.caption)
                    .foregroundColor(.secondary)
                                
                Text(comment.content)
                    .padding(10)
                    .foregroundColor(.primary)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var comment: CommentModel = CommentModel(commentID: "", userID: "", username: "Tanjiro", content: "This is a comment", dateCreated: Date())
    
    static var previews: some View {
        MessageView(comment: comment)
            .previewLayout(.sizeThatFits)
    }
}
