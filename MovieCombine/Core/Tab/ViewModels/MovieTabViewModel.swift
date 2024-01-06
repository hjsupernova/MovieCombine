//
//  MovieTabViewModel.swift
//  MovieCombine
//
//  Created by KHJ on 2024/01/06.
//

import Foundation

enum Views {
    case discover
    case search
}

class MovieTabViewModel: ObservableObject {
    @Published var selectedTap: Views = .discover
}
