//
//  Sign-in.swift
//  Monkbreed-app
//
//  Created by Shubham Biswas on 02/02/24.
//

import SwiftUI

struct Sign_in: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @Environment(\.presentationMode) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 40, content: {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss.wrappedValue.dismiss()
                    }
                
                VStack(alignment: .leading, spacing:15) {
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
                        .keyboardType(.emailAddress)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.1))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(.gray.opacity(0.8), lineWidth: 0.8)
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
                        Sign_up()
                    } label: {
                        Text("Not having accout? **SignUp**")
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundStyle(.white)
                    
                })
                
            })
            .padding()
            .preferredColorScheme(.dark)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Sign_in()
}
