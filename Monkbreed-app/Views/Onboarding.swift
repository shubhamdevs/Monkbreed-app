//
//  Onboarding.swift
//  Monkbreed-app
//
//  Created by Shubham Biswas on 29/01/24.
//

import SwiftUI

struct Onboarding: View {
    
    @State private var isActive = false
    @State private var isExpanded = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        if isActive {
            // We move to Login Screen after that, here we will show login/Registration view
            
        } else {
            ZStack(alignment: .top) {
                VStack {
                    Spacer()
                    
                    // Here we are adding a circle in bottom that show animation
                    
                    Circle()
                        .fill(
                            RadialGradient(colors: [.green, .blue, .clear, .clear, .clear, .clear, .clear, ], center: .center, startRadius: 0, endRadius: UIScreen.main.bounds.width)
                        )
                        .padding(.bottom, -(UIScreen.main.bounds.width / 2))
                        .scaleEffect(isExpanded ? 20 : 2)
                }
                .frame(height: .infinity)
                .zIndex(isExpanded ? 2 : 0)
                
                VStack(spacing: 15, content: {
                    Spacer()
                    Spacer()
                
                    Text("Feel the Cutton like never before")
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                        .foregroundStyle(RadialGradient(colors: [.red, .white, .blue], center: .center, startRadius: 0, endRadius: 200))
                    
                    Text("Smart gorgeous and fashionable collection make you cool...")
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .opacity(0.6)
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "chevron.up")
                        
                        Text("Get Started")
                            .padding(.top)
                    }
                    .fontWeight(.medium)
                })
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("bannerImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.7)
            )
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    Onboarding()
}
