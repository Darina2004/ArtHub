//
//  WelcomScreenView.swift
//  artHub
//
//  Created by Mac on 28.06.24.
//

import SwiftUI

struct WelcomeScreenView: View {
    @StateObject private var viewModel = WelcomeScreenViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                BackgroundImageView(imageName: "Van_Gogh2", imageWidth: $viewModel.imageWidth, imageMoving: $viewModel.imageMoving)
                WelcomeContentView(titleVisible: $viewModel.titleVisible, subtitleVisible: $viewModel.subtitleVisible, buttonsVisible: $viewModel.buttonsVisible)
            }
            .onAppear {
                viewModel.activateAnimations()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
struct WelcomeScreen_previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
