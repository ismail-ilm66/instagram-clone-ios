//
//  ContentViewModel.swift
//  instagram_clone
//
//  Created by Dev on 01/01/2026.
//

import Foundation
import FirebaseAuth
import Combine



class ContentViewModel : ObservableObject
{
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    
    init( )
    {
        setupSubscribers()
        
    }
    
    private func setupSubscribers() {
         service.$userSession
             .sink { [weak self] userSession in
                 self?.userSession = userSession
             }
             .store(in: &cancellables)
     }
    
    
}
