//
//  CurrentProfileViewModel.swift
//  instagram_clone
//
//  Created by Dev on 05/01/2026.
//

import Foundation

class CurrentProfileViewModel: ObservableObject
{
    
    func signOut ()
    {
        AuthService.shared.signOut();
    }
}
