//
//  SettingsEditTextView.swift
//  DogGram
//
//  Created by Robert Basamac on 21.11.2022.
//

import SwiftUI

struct SettingsEditTextView: View {
    
    @Environment(\.colorScheme) private var colorScheme

    @State var submissionText: String = ""
    @State var title: String
    @State var description: String
    @State var placeholder: String
    
    var body: some View {
        VStack {
            Text(description)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField(placeholder, text: $submissionText)
//                .placeholder(shouldShow: submissionText.isEmpty, placeholder: {
//                    Text(placeholder)
//                        .opacity(0.3)
//                })
                .font(.headline)
                .foregroundColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowCollor)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(colorScheme == .light ? Color.MyTheme.beigeColor : Color.MyTheme.purpleColor)
                .cornerRadius(12)
                .textInputAutocapitalization(.sentences)
            
            Button {
                
            } label: {
                Text("Save".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowCollor)
                    .cornerRadius(12)
            }
            .tint(colorScheme == .light ? Color.MyTheme.yellowCollor : Color.MyTheme.purpleColor)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle(title)
    }
}

struct SettingsEditTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsEditTextView(title: "Test title", description: "This is a description", placeholder: "Test Placeholder")
        }
    }
}
