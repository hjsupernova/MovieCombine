//
//  DetailViewModel.swift
//  MovieCombine
//
//  Created by KHJ on 2024/01/04.
//

import Combine
import Foundation

class DetailViewModel: ObservableObject {
    @Published var recommendations: [Movie] = []

    private let movieDetailService: MovieDetailService
    private var cancellables = Set<AnyCancellable>()

    init(movie: Movie) {
        movieDetailService = MovieDetailService(movie: movie)
        addSubscribers()
    }

    func addSubscribers() {
        movieDetailService.$recommendations
            .sink { [weak self] returnedRecommendations in
                self?.recommendations = returnedRecommendations
            }
            .store(in: &cancellables)
    }
}
