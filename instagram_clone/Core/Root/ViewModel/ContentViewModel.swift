//
//  ContentViewModel.swift
//  instagram_clone
//
//  Created by Dev on 01/01/2026.
//

import Foundation
import FirebaseAuth
import Combine


@MainActor
class ContentViewModel : ObservableObject
{
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init( )
    {
        setupSubscribers()
        
    }
    
    
    private func setupSubscribers() {
         service.$userSession
             .receive(on: DispatchQueue.main)
             .sink { [weak self] userSession in
                 self?.userSession = userSession
             }
             .store(in: &cancellables)
        service.$currentUser
            .receive(on: DispatchQueue.main)
            .sink { [weak self] currentUser in
                self?.currentUser = currentUser
            }
            .store(in: &cancellables)
     }
    
    
}
