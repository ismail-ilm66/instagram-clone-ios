//
//  ContentView.swift
//  instagram_clone
//
//  Created by Dev on 10/12/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel: ContentViewModel = ContentViewModel()
    @StateObject var registerViewModel: RegisterViewModel = RegisterViewModel()

    var body: some View {
        Group
        {
            if(contentViewModel.userSession == nil)
            {
                
                LoginView()
                    .environmentObject(registerViewModel)
            }
            else if let currentUser = contentViewModel.currentUser
            {
                MainTabView(currentUser: currentUser)
                
            }
           
        }
    }
}

#Preview {
    ContentView()
}
