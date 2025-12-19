//
//  MainTabView.swift
//  instagram_clone
//
//  Created by Dev on 15/12/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView
        {
            Tab("Feed"  , systemImage: "house" )
            {
                FeedView()
            }
            
            Tab("Search"  , systemImage: "magnifyingglass" )
            {
                SearchView()
            }
            
            Tab("Upload Post"  , systemImage: "plus.square" )
            {
                Text("Upload Post")
            }
            
            Tab("Notifications"  , systemImage: "heart" )
            {
                Text("Notifications")
            }
            
            Tab("Profile"  , systemImage: "person" )
            {
              ProfileView()
            }
        }
        .tint(.black)
        .labelStyle(.iconOnly)
//        TabView{
            
//
//            Tab("Feed"  , systemImage: "house")
//            {
//
//            }
//            
//            Text("Search")
//            
//            Text("Upload Post")
//            
//            Text("Notifications")
//            
//            Text("Profile")
//        }
    }
}

#Preview {
    MainTabView()
}
