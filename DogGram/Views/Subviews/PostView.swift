//
//  PostView.swift
//  DogGram
//
//  Created by Robert Basamac on 17.11.2022.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    var showHeaderAndFooter: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            // MARK: Header
            if showHeaderAndFooter {
                HStack {
                    NavigationLink {
                        ProfileView(profileDisplayName: post.username, profileUserID: post.userID, isMyProfile: false)
                    } label: {
                        Image("dog1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30, alignment: .center)
                            .cornerRadius(15)
                        
                        Text(post.username)
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        .font(.headline)
                }
                .padding(6)
            }
            
            // MARK: Image
            Image("dog1")
                .resizable()
                .scaledToFit()
            
            // MARK: Footer
            if showHeaderAndFooter {
                HStack(alignment: .center, spacing: 20) {
                    Image(systemName: "heart")
                    
                    NavigationLink {
                        CommentsView()
                    } label: {
                        Image(systemName: "bubble.middle.bottom")
                            .foregroundColor(.primary)
                    }

                    Image(systemName: "paperplane")
                }
                .font(.title3)
                .padding(6)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if let caption = post.caption {
                    Text(caption)
                        .padding(6)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Tanjiro", caption: "This is a test caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
    
    static var previews: some View {
        PostView(post: post, showHeaderAndFooter: true)
            .previewLayout(.sizeThatFits)
    }
}
