//
//  FeedCell.swift
//  instagram_clone
//
//  Created by Dev on 16/12/2025.
//

import SwiftUI

struct FeedCell: View {
    @State var isLiked : Bool = false
    var body: some View {
        VStack(alignment: .leading)
        {
            
            // Image + UserName:
            
            HStack            {
                Image("john")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)
                
                Text("sherlock.holmes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                   
            }
            .frame(width: .infinity , alignment: .leading)
            .padding(.horizontal , 8)
            
            // Post Image
            
            Image("sherlock")
                .resizable()
                .scaledToFill()
                .frame(width: .infinity, height: 400)
                .clipShape(Rectangle())
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
              
            
            // Like Comment Share Icon
            
        HStack
            {
                //Like
                Button
                {
                    isLiked = !isLiked
                    
                } label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundStyle(isLiked ? .red : .black)
                    
                }
                
                //Comment
                
                Button
                {
            
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                    
                }
                //Share
                
                Button
                {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                    
                }
            }
            .padding(.leading,8)
                        
            // Likes
            
            Text("23 Likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.leading, 10)
                .padding(.top, 1)
             

            
            // Caption
            
            HStack
            {
                Text("sherlock.holmes ")
                    
                    .font(.footnote)
                    .fontWeight(.semibold)
                 
                +
                Text("Dont Mess with me")
                    
            }
            .font(.footnote)
            .padding(.horizontal,10)
            
            Text("6h ago")
                .foregroundColor(.gray )
                .font(.footnote)
                .padding(.leading, 10)
                
            
            
            
        }
        .padding(.bottom, 8)
    }
    
}

#Preview {
    FeedCell()
}
