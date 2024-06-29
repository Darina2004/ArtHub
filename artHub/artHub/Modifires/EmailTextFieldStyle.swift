//
//  EmailTextFieldStyle.swift
//  artHub
//
//  Created by Mac on 28.06.24.
//

import SwiftUI

struct EmailTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(17)
            .background(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color.gray, lineWidth: 1)
                    .padding(.horizontal, 10)
            )
    }
}


