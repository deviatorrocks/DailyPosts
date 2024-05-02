//
//  NetworkServiceProtocol.swift
//  DailyPosts
//
//  Created by Mandar Kadam on 01/05/24.
//

import Foundation

protocol NetworkService {
    func fetchData<T: Decodable>(url: String, responseType: T.Type) async throws -> T
}
