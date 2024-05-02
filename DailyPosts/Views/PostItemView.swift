//
//  PostItemView.swift
//  DailyPosts
//
//  Created by Mandar Kadam on 01/05/24.
//

import SwiftUI

struct PostItemView: View {
    @State private(set) var identifier: Int?
    @State private(set) var title: String?
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                if let id = identifier {
                    Text("Identifier:  \(id)")
                        .font(.headline)
                }
                if let title = title {
                    Text(title)
                        .font(.subheadline)
                }
                Spacer()
            }
        }
    }
}

struct PostItemView_Previews: PreviewProvider {
    static var previews: some View {
        PostItemView()
    }
}
