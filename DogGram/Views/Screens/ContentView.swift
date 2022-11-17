//
//  ContentView.swift
//  DogGram
//
//  Created by Robert Basamac on 16.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FeedView(posts: PostArrayObject())
                .tabItem {
                    Label("Feed", systemImage: "book.fill")
                }
            
            Text("Screen 2")
                .tabItem {
                    Label("Browse", systemImage: "magnifyingglass")
                }
            
            Text("Screen 3")
                .tabItem {
                    Label("Upload", systemImage: "square.and.arrow.up.fill")
                }
            
            Text("Screen 4")
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .tint(Color.MyTheme.purpleColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
