//
//  DetailView.swift
//  MovieCombine
//
//  Created by KHJ on 2024/01/04.
//

import SwiftUI

struct DetailLoadingView: View {
    let movie: Movie?

    var body: some View {
        ZStack {
            if let movie = movie {
                DetailView(movie: movie)
            }
        }
    }
}

struct DetailView: View {
    @ObservedObject private var detailViewModel: DetailViewModel

    var movie: Movie

    init(movie: Movie) {
        self.movie = movie
        detailViewModel = DetailViewModel(movie: movie)
    }

    var body: some View {
        List {
            ForEach(detailViewModel.recommendations) { recommendation in
                VStack {
                    Text(recommendation.title)
                    Text(String(recommendation.id))
                }
                .onAppear {
                    print("Appeared: \(recommendation.title)")
                }
            }
        }
        .navigationTitle(movie.title)
    }
}

#Preview {
    NavigationStack {
        DetailView(movie: Movie.preview)
    }
}
