//
//  ButtonActionsView.swift
//  artHub
//
//  Created by Mac on 28.06.24.
//

import SwiftUI

struct ButtonActionsView: View {
    @Binding var buttonsVisible: Bool
    
    var body: some View {
            HStack(spacing: 17) {
                NavigationLink(destination: SignUpView()) {
                    Text("Sign up")
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(30)
                }
                
                NavigationLink(destination: LoginView()) {
                    Text("Log in")
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white, lineWidth: 4)
                        )
                        .background(Color.clear)
                        .cornerRadius(30)
                }
            }
            .padding(.horizontal, 19)
            .opacity(buttonsVisible ? 1 : 0)
        }
    }

struct ButtonActionsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonActionsView(buttonsVisible: .constant(true))
    }
}
