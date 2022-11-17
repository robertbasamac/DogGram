//
//  FeedView.swift
//  DogGram
//
//  Created by Robert Basamac on 17.11.2022.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var posts: PostArrayObject
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(posts.dataArray, id: \.self) { post in
                        PostView(post: post)
                    }
                }
            }
            .navigationTitle("Feed View")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FeedView(posts: PostArrayObject())
        }
    }
}
