//
//  PostsViewModel.swift
//  DailyPosts
//
//  Created by Mandar Kadam on 01/05/24.
//

import Foundation

final class PostsViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    @Published var errorMessage: String?
    private let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func fetchPosts() async throws {
        sleep(2)
        Task {
            do {
                let fetchedPosts = try await service.fetchData(url: Constants.postUrl, responseType: [Post].self)
                DispatchQueue.main.async {
                    self.errorMessage = nil
                    self.posts = fetchedPosts
                }
            } catch(let error) {
                DispatchQueue.main.async {
                    self.posts = []
                    self.errorMessage = error.localizedDescription
                }
                throw error
            }
        }
    }
}
