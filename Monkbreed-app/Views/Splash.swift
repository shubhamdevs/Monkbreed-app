//
//  Splash.swift
//  Monkbreed-app
//
//  Created by Shubham Biswas on 29/01/24.
//

import SwiftUI

struct Splash: View {
    
    @State var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                Onboarding()
            } else {
                Text("MONKBREED_")
                    .font(.largeTitle.bold())
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    Splash()
}
