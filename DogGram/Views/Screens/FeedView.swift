//
//  FeedView.swift
//  DogGram
//
//  Created by Robert Basamac on 17.11.2022.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var posts: PostArrayObject
    
    var title: String
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(posts.dataArray, id: \.self) { post in
                        PostView(post: post, showHeaderAndFooter: true, addHeartAnimationToView: true)
                    }
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FeedView(posts: PostArrayObject(), title: "Feed View")
        }
    }
}
