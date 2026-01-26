//
//  ImageUploader.swift
//  instagram_clone
//
//  Created by Dev on 23/01/2026.
//

import Foundation
import UIKit
import Cloudinary

struct ImageUploader {
    
   static func getSecrets()
    {
        guard
            let cloudName = Bundle.main.infoDictionary?["CLOUDINARY_CLOUD_NAME"] as? String,
            let apiKey = Bundle.main.infoDictionary?["CLOUDINARY_API_KEY"] as? String,
            let uploadPreset = Bundle.main.infoDictionary?["CLOUDINARY_UPLOAD_PRESET"] as? String
        else {
            print("Cloudinary config missing!")
            return
        }
        
        print(cloudName, apiKey, uploadPreset)
    }

    static func uploadImage(
        image: UIImage,
    ) async throws -> String? {
        guard
            let cloudName = Bundle.main.infoDictionary?["CLOUDINARY_CLOUD_NAME"] as? String,
            let apiKey = Bundle.main.infoDictionary?["CLOUDINARY_API_KEY"] as? String,
            let uploadPreset = Bundle.main.infoDictionary?["CLOUDINARY_UPLOAD_PRESET"] as? String
        else {
            print("Cloudinary config missing!")
             return ""
        }

        // Now cloudName, apiKey, and uploadPreset are non-optional Strings
        print(cloudName, apiKey, uploadPreset)
        
       
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            print("Image getting failed"
            )
            return nil;
        }




        let config = CLDConfiguration(
            cloudName: cloudName,
            apiKey: apiKey
        )

        let cloudinary = CLDCloudinary(configuration: config)

        return try await withCheckedThrowingContinuation { continuation in
            cloudinary
                .createUploader()
                .upload(
                    data: imageData,
                    uploadPreset: uploadPreset,
                    params: CLDUploadRequestParams()
                )
                .response { response, error in

                    if let error = error {
                        print("Something went wrong: \(error.localizedDescription)")
                        continuation.resume(throwing: error)
                        return
                    }

                    guard let url = response?.secureUrl else {
                        print("secure url error occured.")
                        continuation.resume(throwing: URLError(.badServerResponse))
                        return
                    }
                    print("This is the uploaded url: \(url)")

                    continuation.resume(returning: url)
                }
        }
    }
}
