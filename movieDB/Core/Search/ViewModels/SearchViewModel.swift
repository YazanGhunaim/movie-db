//
//  SearchViewModel.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/7/23.
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    @Published var movies = [Movie]()
    @Published var searchResults = [Movie]()
    
    @Published var searchTerm = ""
    
    var filteredMovies: [Movie] {
        guard !searchTerm.isEmpty else { return movies }
        Task { await fetchSearchResult(forTitle:searchTerm) }
        return searchResults
    }
    
    init() {
        Task { await fetchFeaturedMovies() }
    }
    
    func fetchFeaturedMovies() async {
        self.movies = await MovieService.getFeaturedMovies()
    }
    
    func fetchSearchResult(forTitle title: String) async {
        self.searchResults = await MovieService.getMovieSearchResults(forTitle: title)
    }
}
