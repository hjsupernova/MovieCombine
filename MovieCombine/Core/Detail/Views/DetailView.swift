//
//  DetailView.swift
//  MovieCombine
//
//  Created by KHJ on 2024/01/04.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject private var detailViewModel: DetailViewModel

    var movie: Movie

    init(movie: Movie) {
        self.movie = movie
        detailViewModel = DetailViewModel(movie: movie)
    }
    
    var body: some View {
        List {
            Section("Recommendations") {
                ForEach(detailViewModel.recommendations) { recommendation in
                    Text(recommendation.title)
                }
            }

            Section("Cast Members") {
                ForEach(detailViewModel.castMembers) { castMember in
                    Text(castMember.name)
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
