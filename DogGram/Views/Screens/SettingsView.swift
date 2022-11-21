//
//  SettingsView.swift
//  DogGram
//
//  Created by Robert Basamac on 21.11.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dimiss
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                // MARK: Section 1 - DogGram
                GroupBox {
                    HStack(alignment: .center, spacing: 10) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(12)
                        
                        Text("DogGram is the number one app for posting pictures of your dog and sharing them across the world. We are a dog-loving community and we are happy to have you!")
                            .font(.footnote)
                    }
                } label: {
                    SettingsLabelView(labelText: "DogGram", labelImage: "dot.radiowaves.left.and.right")
                }
                .padding(.horizontal)

                // MARK: Profile
                GroupBox {
                    NavigationLink {
                        SettingsEditTextView(submissionText: "Current display Name", title: "Display Name", description: "You can edit your display name here. This will be seen by other users on your profile and on your posts.", placeholder: "Your Display Name...")
                    } label: {
                        SettingsRowView(leftIcon: "pencil", text: "Display Name", color: Color.MyTheme.purpleColor)
                    }

                    NavigationLink {
                        SettingsEditTextView(submissionText: "Current Bio here", title: "Profile Bio", description: "Your bio is a great place to let other users know a little about you. It will be shown on your profile only.", placeholder: "Your Bio...")
                    } label: {
                        SettingsRowView(leftIcon: "text.quote", text: "Bio", color: Color.MyTheme.purpleColor)

                    }

                    NavigationLink {
                        SettingsEditImageView(title: "Profile Picture", description: "Your profile picture will be shown on your profile and on your posts. Most users make it an image of themselves or of their dog.", selectedImage: UIImage(named: "dog1")!)
                    } label: {
                        SettingsRowView(leftIcon: "photo", text: "Profile Picture", color: Color.MyTheme.purpleColor)
                    }

                    SettingsRowView(leftIcon: "figure.walk", text: "Sign Out", color: Color.MyTheme.purpleColor)

                } label: {
                    SettingsLabelView(labelText: "Profile", labelImage: "person.fill")
                }
                .padding(.horizontal)

                // MARK: Application
                GroupBox {
                    Button {
                        openCustomUrl(urlString: "https://www.google.com/")
                    } label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: Color.MyTheme.yellowCollor)
                    }

                    Button {
                        openCustomUrl(urlString: "https://www.yahoo.com/")
                    } label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Terms & Conditions", color: Color.MyTheme.yellowCollor)
                    }

                    Button {
                        openCustomUrl(urlString: "https://www.bing.com/")
                    } label: {
                        SettingsRowView(leftIcon: "globe", text: "DogGram's Website", color: Color.MyTheme.yellowCollor)
                    }
                } label: {
                    SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                }
                .padding(.horizontal)
                
                // MARK: Sign off
                GroupBox {
                    Text("DogGram was made with love.\nAll Rights Reserved.\nCool Apps Inc.\nCopyright 2020")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
                .padding(.bottom, 80)
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dimiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                    }
                    .tint(.primary)
                }
            }
        }
    }
    
    // MARK: Functions
    private func openCustomUrl(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
