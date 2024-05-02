//
//  Comment.swift
//  DailyPosts
//
//  Created by Mandar Kadam on 02/05/24.
//

import Foundation

struct Comment: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
