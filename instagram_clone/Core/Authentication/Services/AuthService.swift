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
    
    @MainActor
    func login (email: String ,password: String) async throws
    {
        do
        {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        }
        catch{
            print("Failed to login the user: \(error.localizedDescription)")
            
        }
        
        
    }
    
    @MainActor
    func createUser (email: String, password: String, username:String) async throws
    {
        
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
    
    func signOut ( )
    {
      try?  Auth.auth().signOut()
        self.userSession = nil
        
    }
}
