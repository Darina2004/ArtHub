//
//  BackgroundImageView.swift
//  artHub
//
//  Created by Mac on 28.06.24.
//

import SwiftUI

struct BackgroundImageView: View {
    var imageName: String
    @Binding var imageWidth: CGFloat
    @Binding var imageMoving: Bool
    
    var body: some View {
        GeometryReader { geo in
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [.white.opacity(0.1), .clear, .black.opacity(0.9)]), startPoint: .top, endPoint: .bottom)
                        .frame(width: geo.size.width + (self.imageMoving ? self.imageWidth / 2 : 0))
                )
                .onAppear {
                    self.imageWidth = geo.size.width
                }
                .offset(x: self.imageMoving ? -self.imageWidth / 4 : 0, y: 0)
        }
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView(imageName: "Van_Gogh2", imageWidth: .constant(UIScreen.main.bounds.width), imageMoving: .constant(true))
    }
}
