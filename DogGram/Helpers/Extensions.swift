//
//  Extensions.swift
//  DogGram
//
//  Created by Robert Basamac on 16.11.2022.
//

import Foundation
import SwiftUI

extension Color {
    
    struct MyTheme {
        static var purpleColor: Color {
            return Color("ColorPurple")
        }
        
        static var yellowCollor: Color {
            return Color("ColorYellow")
        }
        
        static var beigeColor: Color {
            return Color("ColorBeige")
        }
    }
}

extension View {
    
    func placeholder(_ text: String, shouldShow: Bool, alignment: Alignment = .leading) -> some View {
        placeholder(shouldShow: shouldShow, alignment: alignment) {
            Text(text)
        }
    }
    
    func placeholder<T : View>(shouldShow: Bool, alignment: Alignment = .leading, @ViewBuilder placeholder: () -> T) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
    
    func placeholder<T : View>(shouldShow: Bool, @ViewBuilder placeholder: () -> T) -> some View {
        self.modifier(Placeholder(shouldShow: shouldShow, placeholder: placeholder()))
    }
}

struct Placeholder<T : View>: ViewModifier {
    var shouldShow: Bool
    var placeholder: T
    
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if shouldShow {
                placeholder
            }
            content
        }
    }
}
