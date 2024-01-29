//
//  SignView.swift
//  Monkbreed-app
//
//  Created by Shubham Biswas on 29/01/24.
//

import SwiftUI

struct SignView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40, content: {
            Image(systemName: "arrow.left")
                .imageScale(.large)
            
            VStack(alignment: .leading,spacing:15) {
                Text("Sign-in")
                    .font(.title)
                
                Text("Enter your email address and password and continue shopping.")
                    .font(.callout)
            }
            
            VStack(spacing: 15) {
                TextField("Enter Email Address", text: $email)
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(.gray.opacity(0.1))
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .stroke(.gray.opacity(0.8), lineWidth: 0.8)
                    }
                
                SecureField("Enter Password", text: $password)
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(.gray.opacity(0.1))
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .stroke(.gray.opacity(0.8))
                    }
            }
            
            Spacer()
            
        })
        .padding()
        .preferredColorScheme(.dark)
    }
}

#Preview {
    SignView()
}
