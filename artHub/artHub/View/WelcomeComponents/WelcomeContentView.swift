//
//  WelcomeContentView.swift
//  artHub
//
//  Created by Mac on 28.06.24.
//

import SwiftUI

struct WelcomeContentView: View {
    @Binding var titleVisible: Bool
    @Binding var subtitleVisible: Bool
    @Binding var buttonsVisible: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ArtHubLabel(title: "Explore and connect with art", isVisible: $titleVisible, fontSize: 40)
                    .padding(.horizontal, 15)
                    .padding(.bottom, 13)
                              
                ArtHubLabel(title: "Whether you're an artist or an enthusiast, create your profile, share your work, and join our vibrant community.", isVisible: $subtitleVisible, fontSize: 15)
                    .padding(.horizontal, 15)
                    .padding(.bottom, 20)
                
                ButtonActionsView(buttonsVisible: $buttonsVisible)
                    .padding(.bottom, 105)
            }
            
            VStack {
                Text("ART HUB")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color.clear)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 3)
                Spacer()
            }
            .padding(.top, 60)
        }
    }
}

struct ArtHubLabel: View {
    var title: String
    @Binding var isVisible: Bool
    var fontSize: CGFloat
    
    var body: some View {
        Text(title)
            .font(.system(size: fontSize, weight: .medium, design: .default))
            .foregroundColor(.white)
            .shadow(color: .black.opacity(0.5), radius: 0.5, x: 0, y: 1)
            .opacity(isVisible ? 1 : 0)
    }
}

struct WelcomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeContentView(titleVisible: .constant(true), subtitleVisible: .constant(true), buttonsVisible: .constant(true))
    }
}
