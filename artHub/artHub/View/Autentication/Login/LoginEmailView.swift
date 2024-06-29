//
//  LoginEmailView.swift
//  artHub
//
//  Created by Mac on 29.06.24.
//

import SwiftUI

struct LoginEmailView: View {
    @ObservedObject var viewModel: LoginViewModel
    @Environment(\.presentationMode) var presentationMode
    @FocusState private var isEmailFieldFocused: Bool
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 40) {
                    headerText
                    emailTextField
                    passwordSecureField
                    passwordErrorText
                    forgotPasswordButton
                }
                .fixedSize(horizontal: false, vertical: true)
            }
            Spacer()
            loginButton
        }
    }

    private var headerText: some View {
        Text("Log in")
            .font(.system(size: 30))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 9)
            .padding(.bottom, 40)
    }
    
    private var emailTextField: some View {
        TextField("Email", text: $viewModel.email)
            .textFieldStyle(EmailTextFieldStyle())
            .focused($isEmailFieldFocused)
            .onAppear {
                self.isEmailFieldFocused = true
            }
            .onChange(of: viewModel.email) { newValue in
                viewModel.isEmailValid = viewModel.validateEmail(email: newValue)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(viewModel.isEmailValid ? Color.clear : Color.red, lineWidth: 1)
                    .padding(.horizontal, 10)
            )
    }
    
    private var passwordSecureField: some View {
        SecureField("Password", text: $viewModel.password)
            .textFieldStyle(EmailTextFieldStyle())
            .onChange(of: viewModel.password) { newValue in
                viewModel.isPasswordValid = viewModel.validatePassword(password: newValue)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(viewModel.isPasswordValid ? Color.clear : Color.red, lineWidth: 1)
                    .padding(.horizontal, 10)
            )
    }
    
    private var passwordErrorText: some View {
        Group {
            if !viewModel.isPasswordValid {
                Text("Некорректный пароль")
                    .foregroundColor(.red)
                    .padding(.top, -10)
            }
        }
    }
    
    private var forgotPasswordButton: some View {
        Button("Forgot password?") {
        }
        .padding()
        .padding(.leading, 9)
    }
    
    private var loginButton: some View {
        Button("Log in") {
            if viewModel.isEmailValid && viewModel.isPasswordValid {
                viewModel.login()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(viewModel.isEmailValid && viewModel.isPasswordValid ? Color.black : Color.gray)
        .foregroundColor(.white)
        .cornerRadius(30)
        .padding(.horizontal, 15)
        .padding(.bottom, 15)
        .disabled(!viewModel.isEmailValid || !viewModel.isPasswordValid)
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView(viewModel: LoginViewModel())
    }
}
