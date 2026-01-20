//
//  SearchViewModel.swift
//  instagram_clone
//
//  Created by Dev on 07/01/2026.
//

import Foundation

class SearchViewModel : ObservableObject
{
    @Published var users = [User]()
    
    init() {
        Task{try? await fetchAllUsers()}
    }
    
    @MainActor
    func fetchAllUsers() async throws
    {
        let users = try await UserService.fetchAllUsers()
        self.users = users
    }
}
