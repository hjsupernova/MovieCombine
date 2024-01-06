//
//  DiscoverView.swift
//  MovieCombine
//
//  Created by KHJ on 2023/12/30.
//

import SwiftUI

struct DiscoverView: View {
    @StateObject private var discoverViewModel = DiscoverViewModel()
    // TODO: 옮기기
    @State private var showDetailView: Bool = false
    @State private var selectedMovie: Movie? = nil

    var body: some View {
        NavigationStack {
            List {
                ForEach(discoverViewModel.popular) { movie in
                    NavigationLink(movie.title, value: movie)
                }
            }
            .navigationTitle("Movie")
            .navigationDestination(for: Movie.self) { movie in
                DetailView(movie: movie)
            }
        }
    }

    // TODO: 지우기
    private func segue(movie: Movie) {
        selectedMovie = movie
        showDetailView = true
    }
}

#Preview {
    DiscoverView()
}
