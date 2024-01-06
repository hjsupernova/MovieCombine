//
//  MovieSearchService.swift
//  MovieCombine
//
//  Created by KHJ on 2024/01/06.
//

import Combine
import Foundation

class MovieSearchService {
    @Published var searchedMovies: [Movie] = []
    
    var movieSearchSubscription: AnyCancellable?

    func fetchSearchedMovies(searchText: String) {
        print("DEBUG: Search Start")
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?query=\(searchText)&page=1&api_key=4516ab9bf50f2aa091aeea5f2f5ca6a5") else { return }

        movieSearchSubscription = NetworkingManager.download(url: url)
            .decode(type: MoviePageableList.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedMoviePageableList in
                self?.searchedMovies = returnedMoviePageableList.results
                self?.movieSearchSubscription?.cancel()
            })
    }
}
