//
//  AuthService.swift
//  instagram_clone
//
//  Created by Dev on 01/01/2026.
//

import Foundation
import FirebaseAuth



class AuthService
{
    
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login (withEmail email: String ,password: String) async throws
    {
        
    }
    
    func createUser (email: String, password: String, username:String) async throws
    {
        print(email)
        print(password)
        print(username)
        do
        {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
        }
        catch
        {
            print("Failed to register the user: \(error.localizedDescription)")
        }
        
       
    }
    
    func loadUserData ( ) async throws{
        
    }
    
    func signOut ( ) async throws
    {
        
    }
}
