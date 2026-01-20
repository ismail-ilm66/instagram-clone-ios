//
//  EditProfileViewModel.swift
//  instagram_clone
//
//  Created by Dev on 20/01/2026.
//

import Foundation
import PhotosUI
import SwiftUI



class EditProfileViewModel : ObservableObject
{
    @Published var name: String = ""
    @Published var bio: String = ""
    
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
        
        self.profileImage = Image(uiImage: uiImage)
        
    }
    
    func clearValues ()
    {
        selectedImage = nil
        profileImage = nil
        
    }
}
