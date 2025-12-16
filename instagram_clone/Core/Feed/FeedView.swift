//
//  FeedView.swift
//  instagram_clone
//
//  Created by Dev on 16/12/2025.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
       NavigationStack
        {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(0...15, id: \.self) { _ in
                        FeedCell()
                    }
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar
            {
                
                ToolbarItem(placement: .navigationBarLeading)
                {
                    Image("instagram-text-icon")
                        .resizable()
                               .frame(width: 100, height: 80)
                    
                }
                
                // Dm Button
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    Button
                    {
                        
                    } label:
                    {
                        Image(systemName: "paperplane")
                            .foregroundColor(.black)
                    }
                    
                }
                
            }
            

        }
    }
}

#Preview {
    FeedView()
}
