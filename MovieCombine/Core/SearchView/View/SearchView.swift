//
//  SearchView.swift
//  MovieCombine
//
//  Created by KHJ on 2024/01/06.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var searchViewModel = SearchViewModel()

    let layout = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(searchViewModel.searchedMovies) { movie in
                        NavigationLink(movie.title, value: movie)
                    }
                }
            }
            .scrollIndicators(.never)
            .searchable(
                text: $searchViewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Shows, Movies and More"
            )
            .onSubmit(of: .search) {
                searchViewModel.isSubmitTapped = true 
            }
            .navigationTitle("Search")
            .navigationDestination(for: Movie.self) { movie in
                DetailView(movie: movie)
            }
        }
    }
}

#Preview {
    SearchView()
}
