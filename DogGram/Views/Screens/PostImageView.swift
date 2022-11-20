//
//  PostImageView.swift
//  DogGram
//
//  Created by Robert Basamac on 20.11.2022.
//

import SwiftUI

struct PostImageView: View {
    @Environment(\.dismiss) private var dimiss
    
    @State private var captioNText: String = ""
    @Binding var imageSelected: UIImage
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Button {
                dimiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .padding()
            }
            .tint(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.vertical, showsIndicators: false) {
                Image(uiImage: imageSelected)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200, alignment: .center)
                    .cornerRadius(12)
                    .clipped()
                
                TextField("", text: $captioNText)
                    .placeholder(shouldShow: captioNText.isEmpty, placeholder: {
                        Text("Add your caption...")
                            .opacity(0.3)
                    })
                    .font(.headline)
                    .foregroundColor(Color.MyTheme.purpleColor)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.beigeColor)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .textInputAutocapitalization(.sentences)
                
                Button {
                    postPicture()
                } label: {
                    Text("Post Picture!".uppercased())
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.MyTheme.purpleColor)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .tint(Color.MyTheme.yellowCollor)
            }
        }
    }
    
    // MARK: Functions
    private func postPicture() {
        print("Post picture to database here.")
    }
}

extension View {
    
}

struct PostImageView_Previews: PreviewProvider {
    
    @State static var image = UIImage(named: "dog1")!
    
    static var previews: some View {
        PostImageView(imageSelected: $image)
    }
}
