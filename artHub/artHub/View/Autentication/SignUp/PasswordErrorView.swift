//
//  PasswordErrorView.swift
//  artHub
//
//  Created by Mac on 29.06.24.
//

import SwiftUI

struct PasswordErrorView: View {
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        Group {
            if viewModel.password.count < 8 {
                Text("Password must be at least 8 characters long")
                    .foregroundColor(.red)
                    .font(.caption)
            }
            if !viewModel.passwordContainsNumber {
                Text("Password must contain a number")
                    .foregroundColor(.red)
                    .font(.caption)
            }
            if !viewModel.passwordContainsLetter {
                Text("Password must contain a letter")
                    .foregroundColor(.red)
                    .font(.caption)
            }
            if !viewModel.passwordContainsSpecialCharacter {
                Text("Password must contain a special character")
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
    }
}
