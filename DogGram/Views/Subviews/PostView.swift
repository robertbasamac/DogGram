//
//  PostView.swift
//  DogGram
//
//  Created by Robert Basamac on 17.11.2022.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            // MARK: Header
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30, alignment: .center)
                    .cornerRadius(15)
                
                Text("User name here")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .font(.headline)
            }
            .padding(6)
            
            // MARK: Image
            Image("dog1")
                .resizable()
                .scaledToFit()
            
            // MARK: Footer
            HStack(alignment: .center, spacing: 20) {
                Image(systemName: "heart")
                Image(systemName: "bubble.middle.bottom")
                Image(systemName: "paperplane")
            }
            .font(.title3)
            .padding(6)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("This is the caption for the photo")
                .padding(6)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
            .previewLayout(.sizeThatFits)
    }
}
