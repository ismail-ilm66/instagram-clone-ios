//
//  ProfileHeaderView.swift
//  instagram_clone
//
//  Created by Dev on 07/01/2026.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditPage: Bool = false
    
    var body: some View {
        VStack(spacing: 10)
        {
            // App Bar
            
            // Image and Follower/Following etc.
            HStack
            {
                Group {
                    if let profilePicture = user.profilePicture, !profilePicture.isEmpty {
                        Image(profilePicture)
                            .resizable()
                            .scaledToFill()
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFill()
                    }
                }
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                
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
                Text(user.username )
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(user.bio ?? "")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // Edit Profile Button
            Button
            {
                if user.isCurrentUser {
                    showEditPage.toggle()
                    
                }
                else
                {
                    
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6.0)
                            .stroke(user.isCurrentUser ? .gray: .clear, lineWidth: 1)
                    )
            }
            
            // Divider
            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditPage)  { Text("Edit Page")
        }
        
        
    }
        
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
