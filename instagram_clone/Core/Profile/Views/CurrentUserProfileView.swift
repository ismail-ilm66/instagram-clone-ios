//
//  CurrentUserProfile.swift
//  instagram_clone
//
//  Created by Dev on 26/12/2025.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    var currentUser: User
    
    @StateObject var currentUserProfileViewModel: CurrentProfileViewModel = CurrentProfileViewModel()
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
    ]
    
    var body: some View
    {
        NavigationStack {
            ScrollView{
                VStack
                {
                    // Header:
                    
                    ProfileHeaderView(user: currentUser)

                    
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
                        currentUserProfileViewModel.signOut()
                    } label:
                    {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                    
                }
                
            }
        }
        
    }
}

#Preview {
    CurrentUserProfileView(currentUser: User.MOCK_USERS[0])
}
