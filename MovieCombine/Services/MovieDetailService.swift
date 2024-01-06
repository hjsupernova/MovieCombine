//
//  MovieDetailService.swift
//  MovieCombine
//
//  Created by KHJ on 2024/01/04.
//

import Combine
import Foundation

class MovieDetailService {
    @Published var recommendations: [Movie] = []
    @Published var castMembers: [Credits.CastMember] = []

    var recommendationSubscription: AnyCancellable?
    var creditsSubscription: AnyCancellable?
    var movie: Movie

    init(movie: Movie) {
        self.movie = movie
        fetchRecommendations(for: movie.id)
        fetchCredits(for: movie.id)
    }

    func fetchRecommendations(for movieId: Int) {
        print("Fetch Started")
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/recommendations?api_key=4516ab9bf50f2aa091aeea5f2f5ca6a5") else { return }

        recommendationSubscription = NetworkingManager.download(url: url)
            .decode(type: MoviePageableList.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedMoviePageableList in
                self?.recommendations = returnedMoviePageableList.results
                self?.recommendationSubscription?.cancel()
            })
        
    }

    func fetchCredits(for movieId: Int) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=4516ab9bf50f2aa091aeea5f2f5ca6a5") else { return }

        creditsSubscription = NetworkingManager.download(url: url)
            .decode(type: Credits.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCredits in
                self?.castMembers = returnedCredits.cast
                self?.creditsSubscription?.cancel()
            })
    }
}

