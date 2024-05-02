//
//  ContentView.swift
//  DailyPosts
//
//  Created by Mandar Kadam on 01/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                PostsView()
            }
            .tabItem {
                Label(LocalizedStringKey("Posts"), systemImage: "1.circle")
            }
            
            NavigationView {
                ArticlesView()
            }
            .tabItem {
                Label(LocalizedStringKey("Articles"), systemImage: "2.circle")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
