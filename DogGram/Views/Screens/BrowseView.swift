//
//  BrowseView.swift
//  DogGram
//
//  Created by Robert Basamac on 20.11.2022.
//

import SwiftUI

struct BrowseView: View {
    
    var posts = PostArrayObject()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                CarouselView()
                ImageGridView(posts: posts)
            }
            .navigationTitle("Browse")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BrowseView()
        }
    }
}
