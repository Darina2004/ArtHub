//
//  SignUpViewModel.swift
//  artHub
//
//  Created by Mac on 28.06.24.
//

import SwiftUI
import Combine
import FirebaseAuth

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isEmailValid = false
    @Published var fullName = ""
    @Published var passwordError: String? = nil
    @Published var passwordContainsNumber = false
    @Published var passwordContainsLetter = false
    @Published var passwordContainsSpecialCharacter = false
    @Published var shouldShowEmailView = false
    @Published var shouldShowPasswordView = false
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $email
            .receive(on: RunLoop.main)
            .map(validateEmail)
            .sink(receiveValue: { [unowned self] isValid in
                self.isEmailValid = isValid
            })
            .store(in: &cancellables)
        
        $password
            .receive(on: RunLoop.main)
            .map { [unowned self] password in
                self.validatePassword(password: password)
            }
            .sink(receiveValue: { [unowned self] error in
                self.passwordError = error
                self.shouldShowPasswordView = (error != nil)
            })
            .store(in: &cancellables)
    }
    
    func validateEmail(email: String) -> Bool {
        let emailPattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        return email.range(of: emailPattern, options: .regularExpression) != nil
    }
    
    func validatePassword(password: String) -> String? {
        if password.count < 8 {
            return "Password must be at least 8 characters long"
        }
        if password.rangeOfCharacter(from: .decimalDigits) == nil {
            return "Password must contain a number."
        }
        if password.rangeOfCharacter(from: .letters) == nil {
            return "Password must contain a letter."
        }
        if password.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) == nil {
            return "Password must contain a special character."
        }
        return nil
    }
    
    func signUpWithEmail() {
        shouldShowEmailView = true
    }
    
    func signUpWithApple() {
       
    }
    
    func signUpWithGoogle() {
       
    }
    
    func signUpWithFacebook() {
      
    }
}
