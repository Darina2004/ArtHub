//
//  LoginView.swift
//  artHub
//
//  Created by Mac on 29.06.24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Log in")
                    .font(.system(size: 40))
                    .padding(.leading, 7)
                    .padding(.top, 60)
                    .padding(.bottom, geometry.size.height * 0.06)
                
                Button("Continue with Email") {
                          viewModel.loginWithEmail()
                      }
                      .fullScreenCover(isPresented: $viewModel.shouldShowEmailView) {
                          LoginEmailView(viewModel: viewModel)
                      }
                      .buttonStyle(PrimaryButtonStyle())
                .buttonStyle(PrimaryButtonStyle())
                
                Button("Continue with Apple") {
                    viewModel.loginWithApple()
                }
                .buttonStyle(BlackBackgroundButtonStyle())
                
                Button("Continue with Google") {
                    viewModel.loginWithGoogle()
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Button("Continue with Facebook") {
                    viewModel.loginWithFacebook()
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
