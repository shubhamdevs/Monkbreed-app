//
//  Sign-up.swift
//  Monkbreed-app
//
//  Created by Shubham Biswas on 02/02/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct Sign_up: View {
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isLoading = false
    
    @State private var isSigned = false
    
    @Environment(\.presentationMode) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 40, content: {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss.wrappedValue.dismiss()
                    }
                
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
                
                // SignUp Button
                VStack(content: {
                    Button(action: {
                        // Sign up
                        isLoading.toggle()
                        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                            if error != nil {
                                print(error?.localizedDescription ?? "")
                                withAnimation {
                                    isLoading.toggle()
                                }
                            } else {
                                // Now we store user basic details to firestore database
                                let db = Firestore.firestore()
                                let data: [String: Any] = [
                                    "User Name": username,
                                    "Email": email,
                                ]
                                
                                // Now we add same user name and email to local memory so we don't need to sync every time
                                UserDefaults.standard.setValue(result?.user.uid, forKey: "UID")
                                // UID is unique key provider to user when sign up to firestore database
                                
                                UserDefaults.standard.setValue(username, forKey: "NAME")
                                UserDefaults.standard.setValue(email, forKey: "EMAIL")
                                
                                db.collection("USERS").addDocument(data: data)
                                isLoading.toggle()
                                
                                isSigned = true
                            }
                        }
                    }, label: {
                        if isLoading {
                            ProgressView()
                        } else {
                            Text("SignUp")
                                .fontWeight(.semibold)
                        }
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.red)
                    .clipShape(Capsule())
                    .foregroundStyle(.white)
                    .navigationDestination(isPresented: $isSigned) {
                        ContentView()
                    }
                    
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
