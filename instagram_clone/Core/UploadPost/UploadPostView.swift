//
//  UploadPostView.swift
//  instagram_clone
//
//  Created by Dev on 31/12/2025.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @Binding  var tabIndex: Int
    @State private var caption = ""
    @State private var isPhotosPresented : Bool = true
    @State private var photoItem : PhotosPickerItem?
    @StateObject private var uploadPostViewModel: UploadPostViewModel = UploadPostViewModel()
    
    var body: some View {
        VStack
        {
            
            HStack
            {
                
                Button {
                    uploadPostViewModel.clearValues()
                    caption = ""
                } label: {
                    Text("Cancel")
                    
                        
                }
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                        
                }
                
            }
            HStack(alignment: .top, ){
                if let image = uploadPostViewModel.postImage{
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
//                Image( "sherlock")
                 
                
                
                TextField("Enter your caption"  , text: $caption , axis: .vertical)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .onAppear{
            
        }
        .photosPicker(isPresented: $isPhotosPresented, selection: $uploadPostViewModel.selectedImage)
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
