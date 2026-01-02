//
//  LoginView.swift
//  instagram_clone
//
//  Created by Dev on 19/12/2025.
//

import SwiftUI

struct LoginView: View {
    @State var emailText : String = ""
    @State var passwordText : String = ""
    

    var body: some View {
        NavigationStack {
            VStack
            {
                Spacer()
                // Instagram Logo:
                Image("instagram-text-icon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220,height: 100)
                
                //Email Field:
                
                TextField("Email", text: $emailText)
                    .textInputAutocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                
                
                
                //Password Field:
                
                SecureField("Password", text: $passwordText)
                    .textInputAutocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                
                //Forgot Password Text
                
                Text("Forgot Password?" )
                    .font(.system(size: 14) )
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity , alignment: .trailing)
                    .padding(.top,8)
                    .onTapGesture {
                        
                    }
                
                
                
                //Login Button:
                
                Button
                {
                    
                } label:
                {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                    
                    
                    
                    
                        .padding(.top,8)
                        .padding(.bottom,24)
                }
                
                
                //Or Text:
                HStack {
                    Rectangle()
                        .frame(width: .infinity, height: 0.5)
                    
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 2)
                    
                    Rectangle()
                        .frame(width: .infinity , height: 0.5)
                    
                }
                .foregroundColor(.gray)
                
                //Continue With Facebook:
                
                HStack
                {
                    Image("fb-icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .foregroundColor(Color(.systemBlue))
                        .fontWeight(.semibold)
                    
                }
                
                //Don't Have An Account Sign Up:
                
                Spacer()
                
                NavigationLink
                {
//                    Text("Signup")
                    AddEmailView()
                  
                        .navigationBarBackButtonHidden(true)
                } label:
                {
                    
                    HStack{
                        
                        
                        
                        Text("Don't Have An Account?")
                        
                            .foregroundColor(Color(.systemBlue))
                        + Text(" Signup")
                        
                            .foregroundColor(Color(.systemBlue))
                            .fontWeight(.bold)
                    }
                    .font(.footnote)
                    
                }
                
                
                
            }
            .padding(.all, 24)
        }
        
    }
}

#Preview {
    LoginView()
}
