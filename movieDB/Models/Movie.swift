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
    let adult: Bool
    
    var formattedDate: String {
        return self.releaseDate.convertToShortDateFormat().formatted(.dateTime.day().month().year())
    }
    
    var rating: Double {
        voteAverage / 2
    }
    
    // MARK: Optionals ( gotten with movie details )
    let runtime: Int?
    let genreIDs: [Int]?
    let genres: [Genre]?
    let credits: Credits?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case adult
        
        // optionals
        case runtime
        case genreIDs = "genre_ids"
        case genres
        case credits
        // optionals
        
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case brief = "overview"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}

struct Cast: Codable {
    let id: Int
    let name: String
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case  id
        case name
        case profilePath = "profile_path"
    }
}

struct Credits: Codable {
    let cast, crew: [Cast]
}

struct Genre: Codable {
    let id: Int
    let name: String
}


