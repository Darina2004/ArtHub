//
//  SignUpEmailView.swift
//  artHub
//
//  Created by Mac on 28.06.24.
//

import SwiftUI
import Combine

struct SignUpEmailView: View {
    @ObservedObject var viewModel = SignUpViewModel()
    @State private var shouldShowPasswordView = false
    @FocusState private var isEmailFieldFocused: Bool
    @State private var emailError: String?

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 40) {
                    headerText
                    emailTextField
                    if let error = emailError {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
            }
            nextButton
        }
        .onAppear { isEmailFieldFocused = true }
        .animation(.easeOut(duration: 0.01))
    }

    private var headerText: some View {
        Text("Sign Up with Email")
            .font(.system(size: 30))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 9)
            .padding(.bottom, 40)
    }

    private var emailTextField: some View {
        TextField("Email", text: $viewModel.email)
            .focused($isEmailFieldFocused)
            .autocapitalization(.none)
            .textFieldStyle(EmailTextFieldStyle())
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(emailError == nil ? Color.clear : Color.red, lineWidth: 1)
                    .padding(.horizontal, 10)
            )
            .onChange(of: viewModel.email) { _ in emailError = nil }
    }

    private var nextButton: some View {
        VStack {
            Spacer()
            Button("Next") {
                self.emailError = viewModel.validateEmail(email: viewModel.email) ? nil : "Please provide a valid email address"
                if emailError == nil {
                    shouldShowPasswordView = true
                }
            }
            .fullScreenCover(isPresented: $shouldShowPasswordView) {
                SignUpPasswordView(viewModel: viewModel)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(30)
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
            .disabled(viewModel.email.isEmpty)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct SignUpEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpEmailView()
    }
}
