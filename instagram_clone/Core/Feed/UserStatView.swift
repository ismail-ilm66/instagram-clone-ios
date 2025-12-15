//
//  UserStatView.swift
//  instagram_clone
//
//  Created by Dev on 15/12/2025.
//

import SwiftUI

struct UserStatView: View {
    var title : String
    var numbers : Int
    var body: some View {
        VStack
        {
            Text("\(numbers)")
                .font(.subheadline)
            Text(title)
                .font(.footnote)
        }
    }
}

#Preview {
    UserStatView(title: "Posts", numbers: 3)
}
