//
//  BlackBackgroundButtonStyle.swift
//  artHub
//
//  Created by Mac on 28.06.24.
//

import SwiftUI

struct BlackBackgroundButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(15)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white) 
            .background(Color.black)
            .cornerRadius(30)
    }
}


