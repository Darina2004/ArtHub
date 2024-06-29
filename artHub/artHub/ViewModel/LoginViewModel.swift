//
//  LoginViewModel.swift
//  artHub
//
//  Created by Mac on 28.06.24.
//

import FirebaseAuth
import Combine

class LoginViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var email = ""
    @Published var password = ""
    @Published var isEmailValid = true
    @Published var isPasswordValid = true
    @Published var shouldShowEmailView = false
    var cancellables = Set<AnyCancellable>()
    
    init() {
        $email
            .receive(on: RunLoop.main)
            .map(validateEmail)
            .assign(to: \.isEmailValid, on: self)
            .store(in: &cancellables)
        
        $password
            .receive(on: RunLoop.main)
            .map(validatePassword)
            .assign(to: \.isPasswordValid, on: self)
            .store(in: &cancellables)
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            self?.isAuthenticated = error == nil && authResult?.user != nil
        }
    }
    
    func validateEmail(email: String) -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format:"SELF MATCHES %@", emailPattern).evaluate(with: email)
    }
    
    func validatePassword(password: String) -> Bool {
        return password.count >= 8 && password.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil
    }
    
    func loginWithEmail() {
        shouldShowEmailView = true
    }

    func loginWithApple() {
       
    }

    func loginWithGoogle() {
       
    }
    
    func loginWithFacebook() {
       
    }
}
