//
//  CommentItemView.swift
//  DailyPosts
//
//  Created by Mandar Kadam on 02/05/24.
//

import SwiftUI

struct CommentItemView: View {
    @State private(set) var description: String?
    @State private(set) var name: String?
    @State private(set) var email: String?
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                if let name = name {
                    Text(name)
                        .font(.headline)
                }
                if let description = description {
                    Text(description)
                        .font(.subheadline)
                }
                if let email = email {
                    Text(email)
                        .font(.title2)
                }
            }
        }
    }
}

struct CommentItemView_Previews: PreviewProvider {
    static var previews: some View {
        CommentItemView()
    }
}
