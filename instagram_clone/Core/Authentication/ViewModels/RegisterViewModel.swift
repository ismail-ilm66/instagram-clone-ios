//
//  RegisterViewModel.swift
//  instagram_clone
//
//  Created by Dev on 01/01/2026.
//

import Foundation



class RegisterViewModel : ObservableObject
{
//    @Published var username = ""
//    @Published var email = ""
//    @Published var password = ""
    @Published var email = "" {
        didSet { validateEmail() }
    }
    
    @Published var username = "" {
        didSet { validateUsername() }
    }
    
    @Published var password = "" {
        didSet { validatePassword() }
    }
    
    @Published var emailError: String?
    @Published var usernameError: String?
    @Published var passwordError: String?
    
    
    var isEmailValid: Bool {
          emailError == nil && !email.isEmpty
      }
      
      var isUsernameValid: Bool {
          usernameError == nil && !username.isEmpty
      }
      
      var isPasswordValid: Bool {
          passwordError == nil && !password.isEmpty
      }
    
    @MainActor
    func createUser ( ) async throws
    {
        
       do
       {
        try await   AuthService.shared.createUser(email: email, password: password, username: username);
           username = ""
           email = ""
           password = ""
       }
        catch
        {
            print("Create user failed:", error)
                   throw error 
        }
    }
    
    func signOut ()
    {
        
    }
    
    private func validateEmail() {
           if email.isEmpty {
               emailError = nil
               return
           }
           
           let emailRegex =
           #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
           
           let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
           
           emailError = predicate.evaluate(with: email)
               ? nil
               : "Please enter a valid email address"
       }
    
    
    private func validateUsername() {
           if username.isEmpty {
               usernameError = nil
               return
           }
           
           if username.count < 3 {
               usernameError = "Username must be at least 3 characters"
           } else if username.contains(" ") {
               usernameError = "Username cannot contain spaces"
           } else {
               usernameError = nil
           }
       }
       
       private func validatePassword() {
           if password.isEmpty {
               passwordError = nil
               return
           }
           
           passwordError = password.count >= 6
           ? nil
           : "Password must be at least 6 characters"
       }
}
