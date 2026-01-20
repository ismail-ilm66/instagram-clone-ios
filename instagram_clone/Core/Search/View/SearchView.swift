//
//  SearchView.swift
//  instagram_clone
//
//  Created by Dev on 19/12/2025.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @StateObject var searchViewModel: SearchViewModel = SearchViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(searchViewModel.users) {
                        user in
                        NavigationLink(value: user)
                        {
                            HStack {
//                                if let profilePicture = user.profilePicture, !profilePicture.isEmpty {
//                                    Image(profilePicture)
//                                        .resizable()
//                                        .scaledToFill()
//                                } else {
//                                    Image(systemName: "person.crop.circle.fill")
//                                        .resizable()
//                                        .scaledToFill()
//                                }
//                                    .frame(width: 40, height: 40)
//                                    .clipShape(.circle)
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
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                
                                    
                                VStack (alignment: .leading) {
                                    Text(user.username)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                        
                                    Text(user.fullName ?? "")
                                        .font(.footnote)
                                }
                             }
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
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
