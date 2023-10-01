//
//  Movie.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 9/30/23.
//

import Foundation

struct Response: Codable {
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Codable {
    let id: Int
    let voteCount: Int
    let voteAverage: Double
    let title, brief, posterPath, releaseDate : String
    let genreIDs: [Int]
    let adult: Bool
    
    // MARK: Optionals ( gotten with movie details )
    let runtime: Int?
    let genres: [Genre]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case adult
        
        // optionals
        case runtime
        case genres
        // optionals
        
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case genreIDs = "genre_ids"
        case brief = "overview"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}

struct Genre: Codable {
    let id: Int
    let name: String
}


