//
//  SignUpView.swift
//  artHub
//
//  Created by Mac on 28.06.24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Sign Up")
                    .font(.system(size: 40))
                    .padding(.leading, 7)
                    .padding(.top, 60)
                    .padding(.bottom, geometry.size.height * 0.06)
                
                Button("Continue with Email") {
                          viewModel.signUpWithEmail()
                      }
                      .fullScreenCover(isPresented: $viewModel.shouldShowEmailView) {
                          SignUpEmailView(viewModel: viewModel)
                      }
                      .buttonStyle(PrimaryButtonStyle())
                .buttonStyle(PrimaryButtonStyle())
                
                Button("Continue with Apple") {
                    viewModel.signUpWithApple()
                }
                .buttonStyle(BlackBackgroundButtonStyle())
                
                Button("Continue with Google") {
                    viewModel.signUpWithGoogle()
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Button("Continue with Facebook") {
                    viewModel.signUpWithFacebook()
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
