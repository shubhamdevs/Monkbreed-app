//
//  Sign-up.swift
//  Monkbreed-app
//
//  Created by Shubham Biswas on 02/02/24.
//

import SwiftUI

struct Sign_up: View {
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 40, content: {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                
                VStack(alignment: .leading,spacing:15) {
                    Text("Sign-Up")
                        .font(.title)
                    
                    Text("Enter your email address and password and continue shopping.")
                        .font(.callout)
                }
                
                VStack(spacing: 15) {
                    TextField("User Name", text: $username)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.1))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(.gray.opacity(0.8), lineWidth: 0.8)
                        }
                    
                    TextField("Email Address", text: $email)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.1))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(.gray.opacity(0.8), lineWidth: 0.8)
                        }
                    
                    
                    SecureField("Password", text: $password)
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
                
                VStack(content: {
                    Button(action: {
                        
                    }, label: {
                        Text("LogIn")
                            .fontWeight(.semibold)
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.red)
                    .clipShape(Capsule())
                    .foregroundStyle(.white)
                    
                    NavigationLink {
                        Sign_in()
                    } label: {
                        Text("Already have an account? **Sign-In**")
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundStyle(.white)
                    
                    
                })
                
            })
            .padding()
            .preferredColorScheme(.dark)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    Sign_up()
}
