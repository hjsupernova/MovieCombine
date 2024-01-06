//
//  Logger.swift
//  MovieCombine
//
//  Created by KHJ on 2024/01/06.
//

import Foundation
import OSLog

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier ?? "com.kim.hyunjin.MovieCombine"
    static let network = Logger(subsystem: subsystem, category: "network")
}
