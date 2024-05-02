//
//  PostDetialsView.swift
//  DailyPosts
//
//  Created by Mandar Kadam on 01/05/24.
//

import SwiftUI

struct PostDetailsView: View {
    @ObservedObject private var viewModel: PostDetailsViewModel
    @StateObject var progressBar = ProgressBarUtility()
    @State private var showAlert = false
    
    init(viewModel: PostDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                if let title = viewModel.post.title {
                    Text(title)
                        .font(.headline)
                }
                if let description = viewModel.post.body {
                    Text(description)
                        .font(.subheadline)
                }
                Spacer()
                Text(LocalizedStringKey("Comments"))
                    .font(.headline)
                List() {
                    ForEach(viewModel.comments, id: \.id) { comment in
                        CommentItemView(description: comment.body, name: comment.name, email: comment.email)
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Network Error"), message: Text(viewModel.errorMessage ?? "Unknown error"), dismissButton: .default(Text("OK")))
                }
                .onReceive(viewModel.$errorMessage) { errorMessage in
                    if errorMessage != nil {
                        showAlert = true
                    }
                }
            }
            .padding(.horizontal, geometry.size.width * 0.05) // Adjust the padding as needed
        }
        .overlay(
            ProgressBar(progressBar: progressBar)
                .opacity(progressBar.isLoading ? 1 : 0)
        )
        .task {
            print("Task started")
            progressBar.show()
            do {
                try await viewModel.fetchComments(postId: self.viewModel.post.id)
                progressBar.hide()
            } catch {
                showAlert = true
                progressBar.hide()
            }
            print("Task completed")
        }
    }
}


