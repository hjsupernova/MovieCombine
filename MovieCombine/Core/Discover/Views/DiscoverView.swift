//
//  DiscoverView.swift
//  MovieCombine
//
//  Created by KHJ on 2023/12/30.
//

import SwiftUI

struct DiscoverView: View {
    @StateObject private var discoverViewModel = DiscoverViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(discoverViewModel.popular) { movie in
                    Text(movie.title)
                }
            }
            .navigationTitle("Movie")
        }
    }
}

#Preview {
    DiscoverView()
}
