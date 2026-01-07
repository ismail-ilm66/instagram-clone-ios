//
//  AuthService.swift
//  instagram_clone
//
//  Created by Dev on 01/01/2026.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore



class AuthService
{
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init() {
        Task{ try await loadUserData()}
        
    }
    
    @MainActor
    func login (email: String ,password: String) async throws
    {
        do
        {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
             try? await loadUserData()
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
           await self.saveUserData(id: result.user.uid, username: username, email: email)
            
            
        }
        catch
        {
            print("Failed to register the user: \(error.localizedDescription)")
        }
        
       
    }
    
    func loadUserData ( ) async throws{
        self.userSession = Auth.auth().currentUser
        guard let currentUserId = self.userSession?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(currentUserId).getDocument()
        self.currentUser = try? snapshot.data(as: User.self)
        
        
    }
    
    func signOut ( )
    {
      try?  Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
        
    }
    
    private func saveUserData(id: String, username: String, email: String) async
    {
        let user = User(id: id, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        self.currentUser = user
       
     do
     {
         try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
         
     }
        catch
        {
            print("Failed to save the user data: \(error.localizedDescription)")

        }
        
        
    }
}
