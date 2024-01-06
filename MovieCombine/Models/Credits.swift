//
//  Credits.swift
//  MovieCombine
//
//  Created by KHJ on 2024/01/05.
//

import Foundation

struct Credits: Decodable {
    let id: Int
    let cast: [CastMember]

    enum CodingKeys: String, CodingKey {
        case id
        case cast
    }

    struct CastMember: Decodable, Identifiable {
        let id: Int
        let name: String
        let profilePath: String?

        enum CodingKeys: String, CodingKey {
            case id
            case name
            case profilePath = "profile_path"
        }
    }
}
