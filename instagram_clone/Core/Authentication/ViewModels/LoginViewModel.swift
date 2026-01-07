//
//  LoginViewModel.swift
//  instagram_clone
//
//  Created by Dev on 05/01/2026.
//

import Foundation

class LoginViewModel: ObservableObject
{
    
    @Published var emailText : String = ""
    @Published var passwordText : String = ""
    @Published var isLoading: Bool = false
    
    @MainActor
    func login() async throws
    {
        do
        {
            isLoading = true
            defer { isLoading = false }
         try await AuthService.shared.login(email: emailText, password: passwordText);
        }
         catch
         {
             print("Login user failed:", error)
                    throw error
         }
    }
}
