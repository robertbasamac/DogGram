//
//  SignInWithAppleButtonCustom.swift
//  DogGram
//
//  Created by Robert Basamac on 24.11.2022.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleButtonCustom: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
