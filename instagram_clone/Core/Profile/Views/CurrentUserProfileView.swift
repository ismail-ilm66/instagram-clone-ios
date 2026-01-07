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
                    
                    VStack(spacing: 10)
                    {
                        // App Bar
                        
                        // Image and Follower/Following etc.
                        HStack
                        {
                            Image("john")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(.circle)
                            
                            Spacer()
                            // Posts
                            UserStatView(title: "Posts", numbers: 3)
                            // Followers
                            Spacer()
                            
                            UserStatView(title: "Followers", numbers: 3)
                            
                            Spacer()
                            UserStatView(title: "Following", numbers: 3)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        // Name and Bio
                        VStack(alignment: .leading)
                        {
                            Text(currentUser.username)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                           if let bio = currentUser.bio
                            {
                               Text(bio)
                                   .font(.footnote)
                           }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        // Edit Profile Button
                        Button
                        {} label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 360, height: 32)
                                .foregroundColor(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6.0)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                        }
                        
                        // Divider
                        
                        Divider()
                    }
                    
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
