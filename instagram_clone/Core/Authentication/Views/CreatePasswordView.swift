//
//  CreatePasswordView.swift
//  instagram_clone
//
//  Created by Dev on 24/12/2025.
//

import SwiftUI

struct CreatePasswordView: View {
   
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var registerViewModel: RegisterViewModel
    var body: some View {
     
            VStack(spacing:12)
            {
                Text("Create Password")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Your Password must be of atleast 6 characters in length")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                
                if let error = registerViewModel.passwordError {
                              Text(error)
                                  .font(.footnote)
                                  .foregroundColor(.red)
                                  .frame(maxWidth: .infinity, alignment: .leading)
                          }
                
                
                SecureField("Password", text: $registerViewModel.password)
                    .textInputAutocapitalization(.never)
                
                    .modifier(IGTextFieldModifier())
                
                
                
                NavigationLink
                {
                    CompleteSignUpView()
                        .navigationBarBackButtonHidden()
                    
                } label:
                {
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                        .padding(.top,8)
                        .padding(.bottom,24)
                }
                .disabled(!registerViewModel.isPasswordValid)
                
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
    CreatePasswordView()
}
