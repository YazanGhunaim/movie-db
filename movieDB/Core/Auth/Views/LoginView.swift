//
//  LoginView.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/7/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                // MARK: Image
                Image(systemName: "movieclapper")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)
                
                // MARK: Form
                VStack(spacing: 25) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .textInputAutocapitalization(.never)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    
                    HStack {
                        Spacer()
                        Button("Forgot Password?"){}
                            .font(.footnote.bold())
                            .tint(.indigo)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in
                Button {
                    Task { try await viewModel.signIn(withEmail: email, password: password) }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(.indigo.gradient)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 25)
                
                
                Spacer()
                
                // sign up
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(.indigo)
                    .font(.system(size: 14))
                }
                
            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5
    }
}

#Preview {
    LoginView()
}
