//
//  SearchViewModel.swift
//  MovieCombine
//
//  Created by KHJ on 2024/01/06.
//

import Combine
import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchedMovies: [Movie] = []
    @Published var searchText: String = ""
    @Published var isSubmitTapped: Bool = false

    let movieSearchService = MovieSearchService()
    var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    func addSubscribers() {
        
        $searchText
            .combineLatest($isSubmitTapped)
            .filter { searchText, isSubmitTapped in
                !searchText.isEmpty && isSubmitTapped
            }
            .sink { [weak self] searchText, _ in
                self?.movieSearchService.fetchSearchedMovies(searchText: searchText)
                self?.isSubmitTapped = false
            }
            .store(in: &cancellables)

        movieSearchService.$searchedMovies
            .sink { [weak self] returnedMoives in
                print(returnedMoives.count)
                self?.searchedMovies = returnedMoives
            }
            .store(in: &cancellables)
    }
}
