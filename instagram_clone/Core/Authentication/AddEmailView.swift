//
//  AddEmailView.swift
//  instagram_clone
//
//  Created by Dev on 22/12/2025.
//

import SwiftUI

struct AddEmailView: View {
    
    @State var emailText : String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
     
            VStack(spacing:12)
            {
                Text("Add your email")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("You'll use this email to sign in to your account")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                
                
                TextField("Email", text: $emailText)
                    .textInputAutocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                
                NavigationLink{
                    CreateUsernameView()
                        .navigationBarBackButtonHidden(true)
                    
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
                
                
                
//
                
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
    AddEmailView()
}
