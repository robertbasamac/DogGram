//
//  PostView.swift
//  DogGram
//
//  Created by Robert Basamac on 17.11.2022.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    @State var postIamge: Image = Image("dog1")
    var showHeaderAndFooter: Bool
    
    @State var animateLike: Bool = false
    @State var addHeartAnimationToView: Bool
    
    @State var showActionSheet: Bool = false
    @State var showReportOptions: Bool = false
    
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
                    
                    Button {
                        showActionSheet.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                    }
                    .confirmationDialog("What would you liek to do?", isPresented: $showActionSheet, actions: {
                        Button(role: .destructive) {
                            showReportOptions.toggle()
                        } label: {
                            Text("Report")
                        }
                        
                        Button {
                            print("LEARN MORE")
                        } label: {
                            Text("Learn more...")
                        }
                    }, message: {
                        Text("What would you liek to do?")
                    })
                    .confirmationDialog("Why are you reporting this sheet?", isPresented: $showReportOptions) {
                        Button(role: .destructive) {
                             reportPost(reason: "This is ainapropriate!")
                        } label: {
                            Text("This is inappropriate!")
                        }
                        
                        Button(role: .destructive) {
                             reportPost(reason: "This is spam!")
                        } label: {
                            Text("This is spam!")
                        }
                        
                        Button(role: .destructive) {
                             reportPost(reason: "It made me uncomfortable!")
                        } label: {
                            Text("It made me uncomfortable!")
                        }
                        
                        Button(role: .cancel) {
                            showActionSheet.toggle()
                        } label: {
                            Text("Cancel")
                        }
                    } message: {
                        Text("Why are you reporting this sheet?")
                    }
                    .tint(.primary)
                }
                .padding(6)
            }
            
            // MARK: Image
            ZStack {
                postIamge
                    .resizable()
                    .scaledToFit()
                
                if addHeartAnimationToView {
                    LikeAnimationView(animate: $animateLike)
                }
            }
            
            // MARK: Footer
            if showHeaderAndFooter {
                HStack(alignment: .center, spacing: 20) {
                    Button {
                        if post.likedByUser {
                            unlikePost()
                        } else {
                            likePost()
                        }
                    } label: {
                        Image(systemName: post.likedByUser ? "heart.fill" : "heart")
                    }
                    .tint(post.likedByUser ? .red : .primary)
                    
                    NavigationLink {
                        CommentsView()
                    } label: {
                        Image(systemName: "bubble.middle.bottom")
                            .foregroundColor(.primary)
                    }
                    
                    let link = URL(string: "https://www.google.com")!

                    ShareLink(item: postIamge, message: Text("Check this out!\n\(link)"), preview: SharePreview("Check out this post on DogGram!", image: postIamge)) {
                        Image(systemName: "paperplane")
                    }
                    .tint(.primary)
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
    
    // MARK: Functions
    private func likePost() {
        let updatedPost = PostModel(id: post.id, postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount + 1, likedByUser: true)
        self.post = updatedPost
        
        animateLike = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            animateLike = false
        }
    }
    
    private func unlikePost() {
        let updatedPost = PostModel(id: post.id, postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount - 1, likedByUser: false)
        self.post = updatedPost
    }
    
    private func reportPost(reason: String) {
        print("REPORT POST NOW - reason \(reason)")
    }
    
    private func sharePost() {
        let message = "Check out this post on DogGram!"
        let image = postIamge
        let link = URL(string: "https://www.google.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: nil)
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScenes = scenes.first as? UIWindowScene
        let viewController = windowScenes?.windows.first?.rootViewController
        
        viewController?.present(activityViewController, animated: true)
    }
}

struct PostView_Previews: PreviewProvider {
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Tanjiro", caption: "This is a test caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
    
    static var previews: some View {
        PostView(post: post, showHeaderAndFooter: true, addHeartAnimationToView: true)
            .previewLayout(.sizeThatFits)
    }
}
