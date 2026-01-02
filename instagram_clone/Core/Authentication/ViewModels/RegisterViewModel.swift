//
//  RegisterViewModel.swift
//  instagram_clone
//
//  Created by Dev on 01/01/2026.
//

import Foundation



class RegisterViewModel : ObservableObject
{
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser ( ) async throws
    {
        
       do
       {
        try await   AuthService.shared.createUser(email: email, password: password, username: username);
       }
        catch
        {
            print("Create user failed:", error)
                   throw error 
        }
    }
}
