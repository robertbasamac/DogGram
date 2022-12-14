//
//  CarouselView.swift
//  DogGram
//
//  Created by Robert Basamac on 20.11.2022.
//

import SwiftUI

struct CarouselView: View {
    
    @State var selection: Int = 0
    let maxCount: Int = 8
    
    @State var timerAdded: Bool = false
    
    var body: some View {
        TabView(selection: $selection) {
            
            ForEach(1..<maxCount, id: \.self) { count in
                Image("dog\(count)")
                    .resizable()
                    .scaledToFill()
                    .tag(count)
            }
        }
        .tabViewStyle(.page)
        .frame(height: 300)
        .onAppear {
            if !timerAdded {
                addTimer()
            }
        }
    }
    
    // MARK: Functions
    private func addTimer() {
        timerAdded = true
        
        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            withAnimation {
                if selection == (maxCount - 1) {
                    selection = 1
                } else {
                    selection += 1
                }
            }
        }
        
        timer.fire()
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
            .previewLayout(.sizeThatFits)
    }
}
