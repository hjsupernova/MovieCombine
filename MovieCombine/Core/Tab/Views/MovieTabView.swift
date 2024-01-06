//
//  MovieTabView.swift
//  MovieCombine
//
//  Created by KHJ on 2024/01/06.
//

import SwiftUI

struct MovieTabView: View {
    @StateObject private var movieTabViewModel = MovieTabViewModel()

    var body: some View {
        TabView(selection: $movieTabViewModel.selectedTap) {
            DiscoverView()
                .tabItem {
                    Image(systemName: "house")
                }
                .onAppear { movieTabViewModel.selectedTap = .discover }
                .tag(Views.discover)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear { movieTabViewModel.selectedTap = .search }
                .tag(Views.search)
        }
    }
}

#Preview {
    MovieTabView()
}
