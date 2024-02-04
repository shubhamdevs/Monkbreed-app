//
//  Splash.swift
//  Monkbreed-app
//
//  Created by Shubham Biswas on 29/01/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct Splash: View {
    
    @State var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                // Here nill means the user not signed in to the app if they are signed they will move to contentView
//                if Auth.auth().currentUser != nil {
//                    ContentView()
//                } else {
                    Onboarding()
//                }
                
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
