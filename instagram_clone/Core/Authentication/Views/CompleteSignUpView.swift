//
//  CompleteSignUpView.swift
//  instagram_clone
//
//  Created by Dev on 24/12/2025.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var registerViewModel: RegisterViewModel

    var body: some View {
        
        
               VStack(spacing:12)
               {
                   Spacer()
                   Text("Welcome to Instagram,\(registerViewModel.username)")
                       .font(.title2)
                       .fontWeight(.bold)
                       .padding(.top)
                       .multilineTextAlignment(.center)
                   
                   Text("Click below to complete your registration and start using instagram")
                       .font(.footnote)
                       .foregroundStyle(.gray)
                       .multilineTextAlignment(.center)
                   
                   
                   
                   
                   
                   Button
                   {
                       Task { try await registerViewModel.createUser()}
                   } label:
                   {
                       Text("Complete Sign Up")
                           .foregroundColor(.white)
                           .font(.subheadline)
                           .fontWeight(.semibold)
                           .frame(width: 360, height: 44)
                           .background(Color(.systemBlue))
                           .cornerRadius(10)
                           .padding(.top,8)
                           .padding(.bottom,24)
                   }
                   
                   Spacer()
                   
               }
             
           
           .padding(.horizontal,24)
           .toolbar
           {
               ToolbarItem( placement: .topBarLeading)
               {
                   Image(systemName: "chevron.left")
                       .imageScale(.large)
                       
                       .onTapGesture {
                           dismiss()
                       }
               }
           }
    }
}

#Preview {
    CompleteSignUpView()
}
