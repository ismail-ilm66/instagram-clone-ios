//
//  CreateUsernameView.swift
//  instagram_clone
//
//  Created by Dev on 24/12/2025.
//

import SwiftUI

struct CreateUsernameView: View {
    @EnvironmentObject var registerViewModel: RegisterViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
     
            VStack(spacing:12)
            {
                Text("Add your username")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Pick a username for your account. You can always change it later")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                
                if let error = registerViewModel.usernameError {
                              Text(error)
                                  .font(.footnote)
                                  .foregroundColor(.red)
                                  .frame(maxWidth: .infinity, alignment: .leading)
                          }
                
                TextField("Username", text: $registerViewModel.username)
                    .textInputAutocapitalization(.never)
                    .modifier(IGTextFieldModifier())
                
                
                
                NavigationLink
                {
                    
                    CreatePasswordView()
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
                .disabled(!registerViewModel.isUsernameValid)
                
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
    CreateUsernameView()
}
