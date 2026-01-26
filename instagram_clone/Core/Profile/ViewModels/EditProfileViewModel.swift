//
//  EditProfileViewModel.swift
//  instagram_clone
//
//  Created by Dev on 20/01/2026.
//

import Foundation
import PhotosUI
import SwiftUI
import FirebaseFirestore



class EditProfileViewModel : ObservableObject
{
    
    @Published var user: User
    @Published var name: String = ""
    @Published var bio: String = ""
    private var uiImage: UIImage?
    
    init(user: User,) {
        self.user = user

    }
    
    @Published var selectedImage: PhotosPickerItem?
    {
        didSet { Task { await loadImage (fromItem: selectedImage) } }
    }
    
    @Published var profileImage: Image?
    
    @MainActor
    func loadImage (fromItem item: PhotosPickerItem?) async
    {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        
        guard let uiImage = UIImage(data: data) else { return}
        
        self.uiImage = uiImage
        
        self.profileImage = Image(uiImage: uiImage)
        
    }
    
    
    
    func clearValues ()
    {
        selectedImage = nil
        profileImage = nil
        
    }
    
    func updateUser () async throws
    {
        var data = [String: Any]()
        if !name.isEmpty && user.fullName != name
        {
            data["fullname"] = name
            
        }
        if !bio.isEmpty && user.bio != bio
        {
            data["bio"] = bio
        }
        if let uiImage = uiImage
        {
            print("Adding the image:")
          let imageUrl = try? await  ImageUploader.uploadImage(image: uiImage)
        data["profileImageUrl"] = imageUrl
        }
        if !data.isEmpty
        {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
    
    
}
