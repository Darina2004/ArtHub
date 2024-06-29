//
//  SwiftUIView.swift
//  artHub
//
//  Created by Mac on 29.06.24.
//

import SwiftUI

struct SignUpNameView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var shouldNavigateToNextScreen = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 40) {
                    Text("What's your full name?")
                        .font(.system(size: 30))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 9)
                        .padding(.bottom, 40)
                    
                    TextField("Full Name", text: $viewModel.fullName)
                        .textFieldStyle(EmailTextFieldStyle())
                }
            }
            Spacer()
            Button("Next") {
                shouldNavigateToNextScreen = true
            }
            .fullScreenCover(isPresented: $shouldNavigateToNextScreen) {
                NextView()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(30)
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
        }
    }
}

struct SignUpNameView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpNameView(viewModel: SignUpViewModel())
    }
}
