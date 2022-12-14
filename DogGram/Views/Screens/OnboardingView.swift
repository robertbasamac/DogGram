//
//  OnboardingView.swift
//  DogGram
//
//  Created by Robert Basamac on 24.11.2022.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.dismiss) private var dimiss
    
    @State var showOnboardingPart2: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .shadow(radius: 12)
            
            Text("Welcome to DogGram!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.MyTheme.purpleColor)
            
            Text("DogGram is the #1 app for posting pictures of your dog and sharing them across the world. We are a dog-loving community and we are happy to have you!")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.MyTheme.purpleColor)
                .padding()
            
            Button {
                showOnboardingPart2.toggle()
            } label: {
                SignInWithAppleButtonCustom()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
            }
            
            Button {
                showOnboardingPart2.toggle()
            } label: {
                HStack {
                    Image(systemName: "globe")
                    Text("Sign in with Google")
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.init(red: 222/255, green: 82/255, blue: 70/255))
                .cornerRadius(6)
                .font(.system(size: 23, weight: .medium, design: .default))
            }
            .tint(.white)
            
            Button {
                dimiss()
            } label: {
                Text("Continue as Guest".uppercased())
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding()
            }
            .tint(.black)
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.beigeColor)
        .fullScreenCover(isPresented: $showOnboardingPart2) {
            OnboardingViewPart2()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
