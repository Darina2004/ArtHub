//
//  LoginEmailView.swift
//  artHub
//
//  Created by Mac on 28.06.24.
//

import SwiftUI

struct LoginEmailView: View {
    @ObservedObject var viewModel = LoginViewModel()
    @Environment(\.presentationMode) var presentationMode
    @FocusState private var isEmailFieldFocused: Bool
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 40) {
                    Text("Log in")
                        .font(.system(size: 30))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 9)
                        .padding(.bottom, 40)
                    
                    // Поле ввода электронной почты
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
                        )
                    
                    // Поле ввода пароля
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(EmailTextFieldStyle()) // Используйте новый стиль
                    
                    // Кнопка "Забыли пароль?"
                    Button("Forgot Password?") {
                        // Действие для восстановления пароля
                    }
                    .padding()
                }
                .fixedSize(horizontal: false, vertical: true)
            }
           
            Spacer()
            
            // Кнопка "Войти"
            Button("Log in") {
                if viewModel.isEmailValid && !viewModel.password.isEmpty {
                    viewModel.login()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(viewModel.isEmailValid && !viewModel.password.isEmpty ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(30)
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
            .disabled(!viewModel.isEmailValid || viewModel.password.isEmpty)
        }
    }
}

// Предварительный просмотр
struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView()
    }
}
