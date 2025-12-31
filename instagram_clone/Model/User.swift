//
//  User.swift
//  instagram_clone
//
//  Created by Dev on 26/12/2025.
//

import Foundation

struct User: Identifiable , Hashable, Codable
{
    let id: String
    var username: String
    var fullName: String?
    var bio: String?
    var profilePicture: String?
    let email : String
    
    
}


extension User {
    static var MOCK_USERS: [User] = [
        .init(
            id: NSUUID().uuidString,
            username: "ismail.ilm",
            fullName: "Ismail Saleem",
            bio: "Nothing for the Bio Right now",
            profilePicture: "sherlock",
            email: "ilm@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "john_doe",
            fullName: "John Doe",
            bio: "iOS developer | Coffee enthusiast",
            profilePicture: "john",
            email: "john@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "emma.rose",
            fullName: "Emma Rose",
            bio: "Designing pixels and chasing ideas ✨",
            profilePicture: "girl",
            email: "emma@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "swift.coder",
            fullName: "Alex Morgan",
            bio: "SwiftUI • Firebase • Clean Code",
            profilePicture: "sherlock",
            email: "alex@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "johnny_dev",
            fullName: "Johnny Smith",
            bio: "Building apps one line at a time",
            profilePicture: "john",
            email: "johnny@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "lily.designs",
            fullName: "Lily Anderson",
            bio: "UI/UX designer | Minimalist 🌸",
            profilePicture: "girl",
            email: "lily@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "mobile.ninja",
            fullName: "Ryan Cooper",
            bio: "Mobile apps • iOS & Android",
            profilePicture: "sherlock",
            email: "ryan@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "john_codes",
            fullName: "John Williams",
            bio: "Code. Debug. Repeat.",
            profilePicture: "john",
            email: "jwilliams@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "creative.girl",
            fullName: "Sophia Lee",
            bio: "Art, travel & creativity 🎨✈️",
            profilePicture: "girl",
            email: "sophia@gmail.com"
        )
    ]
}
