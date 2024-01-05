//
//  DiscoverViewModel.swift
//  MovieCombine
//
//  Created by KHJ on 2023/12/30.
//

import Combine
import Foundation

class DiscoverViewModel: ObservableObject {
    @Published var popular: [Movie] = []

    private let movieDataService = MovieDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }

    func addSubscribers() {
        movieDataService.$popular
            .sink { [weak self] returnedPopularMovies in
                self?.popular = returnedPopularMovies
            }
            .store(in: &cancellables)
    }
}
