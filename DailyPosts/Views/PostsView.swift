//
//  PostsView.swift
//  DailyPosts
//
//  Created by Mandar Kadam on 01/05/24.
//

import SwiftUI

struct PostsView: View {
    @ObservedObject private var viewModel = PostsViewModel(service: NetworkServiceImpl())
    @StateObject var progressBar = ProgressBarUtility()
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            List() {
                ForEach(viewModel.posts, id: \.id) { post in
                    NavigationLink(
                        destination: PostDetailsView(
                            viewModel: PostDetailsViewModel(service: NetworkServiceImpl(), post: post))) {
                            PostItemView(
                                identifier: post.id,
                                title: post.body)
                    }
                }
            }
            .navigationTitle(LocalizedStringKey("Posts"))
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Network Error"), message: Text(viewModel.errorMessage ?? "Unknown error"), dismissButton: .default(Text("OK")))
            }
            .onReceive(viewModel.$errorMessage) { errorMessage in
                if errorMessage != nil {
                    showAlert = true
                }
            }
        }
        .padding()
        .overlay(
            ProgressBar(progressBar: progressBar)
                .opacity(progressBar.isLoading ? 1 : 0)
        )
        .task {
            progressBar.show()
            do {
                try await viewModel.fetchPosts()
                progressBar.hide()
            } catch {
                showAlert = true
                progressBar.hide()
            }
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
