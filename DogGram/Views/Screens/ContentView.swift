//
//  ContentView.swift
//  DogGram
//
//  Created by Robert Basamac on 16.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    var currentUserID: String? = nil
    
    var body: some View {
        TabView {
            FeedView(posts: PostArrayObject(), title: "Feed View")
                .tabItem {
                    Label("Feed", systemImage: "book.fill")
                }
            
            BrowseView()
                .tabItem {
                    Label("Browse", systemImage: "magnifyingglass")
                }
            
            UploadView()
                .tabItem {
                    Label("Upload", systemImage: "square.and.arrow.up.fill")
                }
            
            ZStack {
                if currentUserID != nil {
                    ProfileView(profileDisplayName: "My Profile", profileUserID: "", isMyProfile: true)
                } else {
                    SignUpView()
                }
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
            
        }
        .tint(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowCollor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
