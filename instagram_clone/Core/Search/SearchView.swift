//
//  SearchView.swift
//  instagram_clone
//
//  Created by Dev on 19/12/2025.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(User.MOCK_USERS) {
                        user in
                        NavigationLink(value: user)
                        {
                            HStack {
                                Image(user.profilePicture ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
                                    
                                VStack (alignment: .leading) {
                                    Text(user.username)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                        
                                    Text(user.fullName ?? "")
                                        .font(.footnote)
                                }
                             }
                            .foregroundColor(.black)
                            .frame(width: .infinity, alignment: .leading)
                            .padding(.horizontal, 16)
                        }
                    }
                }
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: { user in ProfileView(user: user)} )
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
     }
}

#Preview {
    SearchView()
}
