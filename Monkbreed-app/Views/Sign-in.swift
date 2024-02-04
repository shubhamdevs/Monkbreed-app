//
//  Sign-in.swift
//  Monkbreed-app
//
//  Created by Shubham Biswas on 02/02/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct Sign_in: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isLoading = false
    
    // Now we add new var isSigned so when user successfully log in then they will move to main screen
    @State private var isSinged = false
    
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
                
                // login Button
                VStack(content: {
                    Button(action: {
                        // Here we add isLoading = true because we see progressview not show after click
                        isLoading = true
                        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                            if error != nil {
                                print(error?.localizedDescription ?? "")
                                withAnimation {
                                    isLoading.toggle()
                                }
                            } else {
                                // Now we collect user information and move to next view in app.
                                // this we will do after signup view code.
                                // Here user successfully sign in so we change isSigned value to true
                                isSinged = true
                                
                                let db = Firestore.firestore()
                                db.collection("USERS").document(result?.user.uid ?? "").getDocument { document, error in
                                    if let document = document, document.exists {
                                        let name = document.get("User_Name") as? String ?? ""
                                        let email = document.get("Email") as? String ?? ""
                                        
                                        // Now we store collected name and email from firestore to local storage
                                        UserDefaults.standard.set(name, forKey: "NAME")
                                        UserDefaults.standard.set(email, forKey: "EMAIL")
                                        
                                        isLoading.toggle()
                                    }
                                    else {
                                        isLoading.toggle()
                                        print("Document Not Exist")
                                    }
                                }
                            }
                        }
                    }, label: {
                        // When is processing data we show progress in button so we add
                        if isLoading {
                            ProgressView()
                        } else {
                            Text("LogIn")
                                .fontWeight(.semibold)
                        }
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.red)
                    .clipShape(Capsule())
                    .foregroundStyle(.white)
                    .navigationDestination(isPresented: $isSinged) {
                        ContentView()
                    }
                    
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
