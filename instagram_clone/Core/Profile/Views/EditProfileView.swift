 //
//  EditProfileView.swift
//  instagram_clone
//
//  Created by Dev on 07/01/2026.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var editProfileViewModel: EditProfileViewModel
    
    
    
    init(user:User)
    {
        self._editProfileViewModel = StateObject(wrappedValue: EditProfileViewModel(user:user))
        
    }
    
    
    var body: some View {
        VStack
        {
            
            // Toolbar:
            HStack{
                Button("Cancel")  {
                    editProfileViewModel.clearValues()
                    dismiss()
                    
                }
                Spacer()
                
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button{
                    Task { try? await  editProfileViewModel.updateUser()}
                } label:{
                    Text("Done")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            // Edit Profile Picture:
            
            PhotosPicker(selection: $editProfileViewModel.selectedImage)
            {
               VStack
                {
                    Group
                    {
                        if let image = editProfileViewModel.profileImage
                        {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .foregroundStyle(.gray)
                        }
                        else
                        {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    Text("Edit Profile Picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
                
                
            }
            .padding(.vertical , 8)
            
         
            
            // Name And Bio:
            
            EditProfileRowView(title: "Name", placeholder: "Enter Your Name", text: $editProfileViewModel.name)
            
            EditProfileRowView(title: "Bio", placeholder: "Enter Your Bio", text: $editProfileViewModel.bio)
            
            Spacer()
            
        }
        
    }
        
}

struct EditProfileRowView : View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        
        HStack
        {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack
            {
                TextField(placeholder, text:$text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
        
        
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USERS[0])
}
