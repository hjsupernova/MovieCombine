//
//  MovieDataService.swift
//  MovieCombine
//
//  Created by KHJ on 2023/12/30.
//

import Combine
import Foundation

class MovieDataService {
    @Published var popular: [Movie] = []
    var movieSubscription: AnyCancellable?

    init() {
        fetchPopular()
    }

    func fetchPopular() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=4516ab9bf50f2aa091aeea5f2f5ca6a5") else { return }

        movieSubscription = NetworkingManager.download(url: url)
            .decode(type: MoviePageableList.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedMoviePageableList in
                self?.popular = returnedMoviePageableList.results
                self?.movieSubscription?.cancel()
            })
    }

}
