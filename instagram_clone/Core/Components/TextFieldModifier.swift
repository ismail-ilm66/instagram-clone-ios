//
//  TextFieldModifier.swift
//  instagram_clone
//
//  Created by Dev on 23/12/2025.
//

import SwiftUI

struct IGTextFieldModifier : ViewModifier
{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}
