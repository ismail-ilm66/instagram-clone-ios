//
//  UserService.swift
//  instagram_clone
//
//  Created by Dev on 07/01/2026.
//

import Foundation
import Firebase
import FirebaseFirestore

struct UserService
{
    
  static  func fetchAllUsers() async throws -> [User]
    {
        var users = [User]()
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        
        for doc in documents
        {
      
            guard let user = try? doc.data(as: User.self) else { continue }
            users.append(user)
        }
        return users
        
    }
}
