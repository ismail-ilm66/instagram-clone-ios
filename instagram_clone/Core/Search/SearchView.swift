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
                    ForEach(0 ... 15, id: \.self) {
                        _ in
                        HStack {
                            Image("john")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(.circle)
                                
                            VStack {
                                Text("sherlock.holmes")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    
                                Text("Sherlock Holmes")
                                    .font(.footnote)
                            }
                         }
                        .frame(width: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                    }
                }
                .searchable(text: $searchText, prompt: "Search...")
            }
                
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
     }
}

#Preview {
    SearchView()
}
