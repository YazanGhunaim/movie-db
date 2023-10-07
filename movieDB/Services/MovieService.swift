//
//  MovieService.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 9/30/23.
//

import Foundation

struct MovieService {
    
    /// getting a list of popular movies
    static func getFeaturedMovies() async -> [Movie] {
        guard let url = URL(string: FEATURED_MOVIES_BASE_URL) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Response.self, from: data)
            return response.movies
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
            return []
        }
    }
    
    /// getting specific details of a movie using TMDB ID
    static func getMovieDetails(forID id: Int) async -> Movie? {
        guard let url = URL(string: MOVIE_DETAILS_BASE_URL(forID: id)) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Movie.self, from: data)
            return response
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
            return nil
        }
    }
    
    /// getting now showing in cinemas movies
    static func getNowShowingMovies() async -> [Movie] {
        guard let url = URL(string: NOW_SHOWING_MOVIES_BASE_URL) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Response.self, from: data)
            return response.movies
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
            return []
        }
    }
    
    /// get list of movie based on search result
    static func getMovieSearchResults(forTitle title: String) async -> [Movie] {
        guard let url = URL(string: MOVIE_SEARCH(forTitle: title)) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Response.self, from: data)
            return response.movies
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
            return []
        }
    }
}
