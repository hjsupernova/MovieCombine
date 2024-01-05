//
//  DiscoverView.swift
//  MovieCombine
//
//  Created by KHJ on 2023/12/30.
//

import SwiftUI

struct DiscoverView: View {
    @StateObject private var discoverViewModel = DiscoverViewModel()
    @State private var showDetailView: Bool = false
    @State private var selectedMovie: Movie? = nil

    var body: some View {
        NavigationStack {
            List {
                ForEach(discoverViewModel.popular) { movie in
                    Text(movie.title)
                        .onTapGesture {
                            segue(movie: movie)
                        }
                }
            }
            .navigationTitle("Movie")
            .background(
                NavigationLink(destination: DetailLoadingView(movie: selectedMovie), isActive: $showDetailView, label: {
                    EmptyView()
                })
            )
        }
    }

    private func segue(movie: Movie) {
        selectedMovie = movie
        showDetailView = true
    }
}

#Preview {
    DiscoverView()
}
