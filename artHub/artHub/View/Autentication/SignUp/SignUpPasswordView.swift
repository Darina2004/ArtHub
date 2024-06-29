//
//  SwiftUIView.swift
//  artHub
//
//  Created by Mac on 28.06.24.
//

import SwiftUI
import Combine

struct SignUpPasswordView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var shouldShowNameView = false
    @State private var showErrorMessages = false
    @State private var passwordError: String?

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 40) {
                    headerText
                    passwordSecureField
                    errorMessageView
                }
            }
            nextButton
        }
        .animation(.easeOut(duration: 0.01))
    }

    private var headerText: some View {
        Text("Sign Up with Email")
            .font(.system(size: 30))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 9)
            .padding(.bottom, 40)
    }

    private var passwordSecureField: some View {
        SecureField("Password", text: $viewModel.password, onCommit: {
            self.passwordError = viewModel.validatePassword(password: viewModel.password)
        })
        .textFieldStyle(EmailTextFieldStyle())
        .overlay(
            RoundedRectangle(cornerRadius: 7)
                .stroke(passwordError == nil ? Color.clear : Color.red, lineWidth: 1)
                .padding(.horizontal, 10)
        )
        .onChange(of: viewModel.password) { _ in
            self.passwordError = nil
            self.showErrorMessages = false
        }
    }

    private var errorMessageView: some View {
        Group {
            if let error = passwordError, showErrorMessages {
                Text(error)
                    .foregroundColor(.red)
            }
        }
    }

    private var nextButton: some View {
        VStack {
            Spacer()
            Button("Next") {
                self.passwordError = viewModel.validatePassword(password: viewModel.password)
                self.showErrorMessages = passwordError != nil
                shouldShowNameView = passwordError == nil
            }
            .fullScreenCover(isPresented: $shouldShowNameView) {
                SignUpNameView(viewModel: viewModel)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(30)
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
            .disabled(viewModel.password.isEmpty)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct SignUpPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPasswordView(viewModel: SignUpViewModel())
    }
}
