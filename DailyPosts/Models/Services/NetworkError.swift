//
//  NetworkError.swift
//  DailyPosts
//
//  Created by Mandar Kadam on 01/05/24.
//

import Foundation

enum NetworkError: LocalizedError {
    case customError(error: Error)
    case failedToDecode
    case invalidStatusCode
}
