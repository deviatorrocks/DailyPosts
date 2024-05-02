//
//  NetworkServiceImpl.swift
//  DailyPosts
//
//  Created by Mandar Kadam on 01/05/24.
//

import Foundation

class NetworkServiceImpl: NetworkService {
    func fetchData<T: Decodable>(url: String, responseType: T.Type) async throws -> T {
        do {
            let (data, response) = try await URLSession.shared.data(from: URL(string: url)!)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.invalidStatusCode
            }
            
            let jsonDecoder = JSONDecoder()
            let decodedData = try jsonDecoder.decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.customError(error: error)
        }
    }
}
