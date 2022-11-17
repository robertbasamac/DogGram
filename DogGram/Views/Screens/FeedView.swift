//
//  FeedView.swift
//  DogGram
//
//  Created by Robert Basamac on 17.11.2022.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                PostView()
                PostView()
                PostView()
            }
            .navigationTitle("Feed View")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FeedView()
        }
    }
}
