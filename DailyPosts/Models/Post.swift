//
//  Post.swift
//  DailyPosts
//
//  Created by Mandar Kadam on 01/05/24.
//

import Foundation

struct Post: Codable, Identifiable {
    let userID, id: Int
    let title, body: String
    var urlToImage: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case urlToImage = "thumbnailUrl"
        case id, title, body
    }
}
