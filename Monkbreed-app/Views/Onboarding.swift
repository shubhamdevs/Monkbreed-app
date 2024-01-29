//
//  Onboarding.swift
//  Monkbreed-app
//
//  Created by Shubham Biswas on 29/01/24.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        ZStack {
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("bannerImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .preferredColorScheme(.dark)
    }
}

#Preview {
    Onboarding()
}
