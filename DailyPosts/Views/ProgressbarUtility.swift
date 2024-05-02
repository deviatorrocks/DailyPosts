//
//  ProgressbarUtility.swift
//  DailyPosts
//
//  Created by Mandar Kadam on 02/05/24.
//

import SwiftUI

class ProgressBarUtility: ObservableObject {
    @Published var isLoading: Bool = false
    
    func show() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
}

struct ProgressBar: View {
    @ObservedObject var progressBar: ProgressBarUtility
    
    var body: some View {
        if progressBar.isLoading {
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle())
                .padding()
                .background(Color.black.opacity(0.5))
                .foregroundColor(Color.white)
                .cornerRadius(10)
        } else {
            EmptyView()
        }
    }
}
