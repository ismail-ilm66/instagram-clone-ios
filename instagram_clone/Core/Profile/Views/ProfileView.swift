//
//  ProfileView.swift
//  instagram_clone
//
//  Created by Dev on 15/12/2025.
//

import SwiftUI

struct ProfileView: View
{
    
    let user: User
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
    ]
    
    var body: some View
    {
        
            ScrollView{
                VStack
                {
                    // Header:
                    
                  ProfileHeaderView(user: user)
                    // Grid View Of Images:
                    
                    LazyVGrid(columns: gridItems, spacing: 2)
                    {
                        ForEach(0 ... 25, id: \.self)
                        {
                            _ in Image("girl")
                                .resizable()
                                .scaledToFill()
                            
                        }
                    }
                }
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar
            {
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    Button
                    {
                        
                    } label:
                    {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                    
                }
                
            }
        
        
    }
}

#Preview
{
    ProfileView(user: User.MOCK_USERS[0])
}
