//
//  PostDetailsViewModel.swift
//  DailyPosts
//
//  Created by Mandar Kadam on 02/05/24.
//

import Foundation

final class PostDetailsViewModel: ObservableObject {
    
    private let service: NetworkService
    @Published var post: Post
    @Published var comments = [Comment]()
    @Published var errorMessage: String?
    
    init(service: NetworkService, post: Post) {
        self.service = service
        self.post = post
    }
    
    func fetchComments(postId: Int) async throws {
        sleep(2)
        Task {
            do {
                let url = "\(Constants.commentUrl)\(postId)"
                let fetchComments = try await service.fetchData(url: url, responseType: [Comment].self)
                DispatchQueue.main.async {
                    self.errorMessage = nil
                    self.comments = fetchComments
                }
            } catch(let error) {
                self.errorMessage = error.localizedDescription
                throw error
            }
        }
    }
}
