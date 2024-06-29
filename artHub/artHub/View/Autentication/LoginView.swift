//
//  LoginView.swift
//  artHub
//
//  Created by Mac on 28.06.24.
//

import SwiftUI

// Основной вид LoginView
struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingLogin = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                // Использование CustomBackButton как модификатор
                Text("Log in")
                    .font(.system(size: 40))
                    .padding(.leading, 7)
                    .padding(.top, 60)
                    .padding(.bottom, geometry.size.height * 0.06)
                
                
                // Кнопка "Continue with Email"
                
                Button("Continue with Email") {
                    self.showingLogin = true
                }
                .buttonStyle(PrimaryButtonStyle())
                .fullScreenCover(isPresented: $showingLogin) {
                    LoginEmailView()
                }
                
                // Кнопка "Continue with Apple"
                Button(action: {
                    // Действие при выборе входа через Apple
                }) {
                    Text("Continue with Apple")
                        .foregroundStyle(.white)
                    
                }
                .buttonStyle(BlackBackgroundButtonStyle())
                
                
                // Кнопка "Continue with Google"
                Button(action: {
                    // Действие при выборе входа через Google
                }) {
                    Text("Continue with Google")
                }
                .buttonStyle(PrimaryButtonStyle())
                
                // Кнопка "Continue with Facebook"
                Button(action: {
                    // Действие при выборе входа через Facebook
                }) {
                    Text("Continue with Facebook")
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Spacer()
                
            }
            
            .padding(.horizontal, 20)
        }
    }
}

// Предпросмотр для LoginView
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
