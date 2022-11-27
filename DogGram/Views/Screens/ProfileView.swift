//
//  ProfileView.swift
//  DogGram
//
//  Created by Robert Basamac on 21.11.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @State var profileDisplayName: String
    var profileUserID: String
    var isMyProfile: Bool
    
    var posts: PostArrayObject = PostArrayObject()
    
    @State var showSettings: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ProfileHeaderView(profileDisplayName: $profileDisplayName)
                
                Divider()
                
                ImageGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSettings.toggle()
                    } label: {
                        Image(systemName: "line.horizontal.3")
                    }
                    .tint(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowCollor)
                    .opacity(isMyProfile ? 1 : 0)
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
        }
        .tint(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowCollor)
    }
}

struct ProfileView_Previews: PreviewProvider {    
    static var previews: some View {
        ProfileView(profileDisplayName: "Joe", profileUserID: "", isMyProfile: true)
    }
}
