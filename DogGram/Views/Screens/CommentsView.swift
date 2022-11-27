//
//  CommentsView.swift
//  DogGram
//
//  Created by Robert Basamac on 17.11.2022.
//

import SwiftUI

struct CommentsView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State var submissionText: String = ""
    @State var commentArray: [CommentModel] = []
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(commentArray, id: \.self) { comment in
                        MessageView(comment: comment)
                    }
                }
            }
            
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
                
                TextField("Add a comment...", text: $submissionText)
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                }
                .tint(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowCollor)
            }
            .padding(6)
        }
        .padding(.horizontal)
        .navigationTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            getComments()
        }
    }
    
    // MARK: Functions
    
    private func getComments() {
        print("Get comments from Databse")
        let comment1 = CommentModel(commentID: "", userID: "", username: "Basamac", content: "This is Basamac's comment", dateCreated: Date())
        let comment2 = CommentModel(commentID: "", userID: "", username: "Zenitsu", content: "This is Zenitsu's comment", dateCreated: Date())
        let comment3 = CommentModel(commentID: "", userID: "", username: "Marian", content: "This is Marian's comment", dateCreated: Date())
        
        self.commentArray.append(comment1)
        self.commentArray.append(comment2)
        self.commentArray.append(comment3)
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CommentsView()
        }
    }
}
