//
//  WelcomeScreenViewModel.swift
//  artHub
//
//  Created by Mac on 28.06.24.
//

import SwiftUI

class WelcomeScreenViewModel: ObservableObject {
    @Published var xOffset: CGFloat = 0
    @Published var imageWidth: CGFloat = 0
    @Published var titleVisible: Bool = false
    @Published var subtitleVisible: Bool = false
    @Published var buttonsVisible: Bool = false
    @Published var imageMoving: Bool = false
    
    // Инициализация анимаций и задержек
    func activateAnimations() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(.easeOut(duration: 1)) {
                self.titleVisible = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.easeOut(duration: 1)) {
                self.subtitleVisible = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.easeOut(duration: 1)) {
                self.buttonsVisible = true
            }
        }
        withAnimation(Animation.easeInOut(duration: 10)) {
            self.imageMoving = true
        }
    }
}
