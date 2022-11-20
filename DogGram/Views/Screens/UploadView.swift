//
//  UploadView.swift
//  DogGram
//
//  Created by Robert Basamac on 20.11.2022.
//

import SwiftUI
import PhotosUI

struct UploadView: View {
    
    @State var showIamgePicker: Bool = false
    
//    @State var imageSelected: [PhotosPickerItem] = []
    @State var imageSelected: UIImage = UIImage(named: "logo")!
    
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    @State var showPostImageView: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Button {
                    sourceType = .camera
                    showIamgePicker.toggle()
                } label: {
                    Text("Take photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.yellowCollor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.MyTheme.purpleColor)
                
//                PhotosPicker(selection: $imageSelected, maxSelectionCount: 1, selectionBehavior: .default, matching: .images, preferredItemEncoding: .automatic) {
//                    Text("Import photo".uppercased())
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color.MyTheme.purpleColor)
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//                .background(Color.MyTheme.yellowCollor)
                
                Button {
                    sourceType = .photoLibrary
                    showIamgePicker.toggle()
                } label: {
                    Text("Import photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.purpleColor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.MyTheme.yellowCollor)
            }
            .clipped()
            .sheet(isPresented: $showIamgePicker, onDismiss: {
                showPostImageView.toggle()
            }) {
                ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)
            }
            
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .shadow(color: Color.MyTheme.yellowCollor, radius: 15, x: 0, y: -5)
                .shadow(color: Color.MyTheme.purpleColor, radius: 15, x: 0, y: 5)
                .fullScreenCover(isPresented: $showPostImageView) {
                    PostImageView(imageSelected: $imageSelected)
                }

        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
