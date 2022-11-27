//
//  OnboardingViewPart2.swift
//  DogGram
//
//  Created by Robert Basamac on 26.11.2022.
//

import SwiftUI

struct OnboardingViewPart2: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State var displayName: String = ""
    @State var showImagePicker: Bool = false
    
    @State var imageSelected: UIImage = UIImage(named: "logo")!
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("What is your name?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.yellowCollor)
            
            TextField("Add your name here...", text: $displayName)
//                .placeholder(shouldShow: displayName.isEmpty, placeholder: {
//                    Text("Add your name here...")
//                        .opacity(0.5)
//                })
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.MyTheme.beigeColor)
                .cornerRadius(12)
                .font(.headline)
                .foregroundColor(Color.MyTheme.purpleColor)
                .textInputAutocapitalization(.sentences)
                .padding(.horizontal)
            
            Button {
                showImagePicker.toggle()
            } label: {
                Text("Finish: Add profile picture")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.MyTheme.purpleColor.opacity(displayName.isEmpty ? 0.3 : 1.0))
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.yellowCollor)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            .tint(Color.MyTheme.purpleColor)
            .disabled(displayName.isEmpty)
            .animation(.easeInOut(duration: 1.0), value: !displayName.isEmpty)
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.purpleColor)
        .sheet(isPresented: $showImagePicker) {
            createProfile()
        } content: {
            ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)
                .edgesIgnoringSafeArea(.bottom)
                .tint(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowCollor)
        }
    }
    
    // MARK: Functions
    func createProfile() {
        print("Create profile")
    }
}

struct OnboardingViewPart2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewPart2()
    }
}
