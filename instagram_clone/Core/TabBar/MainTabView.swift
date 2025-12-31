//
//  MainTabView.swift
//  instagram_clone
//
//  Created by Dev on 15/12/2025.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex: Int = 0
    var body: some View {
        TabView(selection: $selectedIndex)
        {
            Tab("Feed"  , systemImage: "house", value: 0 )
            {
                FeedView()
//                    .onAppear{
//                        
//                        selectedIndex = 0
//                    }
            }
            
            
            Tab("Search"  , systemImage: "magnifyingglass", value: 1 )
            {
                SearchView()
                    
                    
            }
            
            Tab("Upload Post"  , systemImage: "plus.square",value: 2 )
            {
               UploadPostView(tabIndex: $selectedIndex)
               
            }
            
            Tab("Notifications"  , systemImage: "heart" ,value: 3)
            {
                Text("Notifications")

            }
            
            Tab("Profile"  , systemImage: "person",value: 4 )
            {
              CurrentUserProfileView()
                   
            }
        }
        .tint(.black)
        .labelStyle(.iconOnly)

    }
}

#Preview {
    MainTabView()
}
