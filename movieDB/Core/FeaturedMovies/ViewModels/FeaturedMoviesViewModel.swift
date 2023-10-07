//
//  FeaturedMoviesViewModel.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 9/30/23.
//

import Foundation

class FeaturedMoviesViewModel: ObservableObject {
    @Published var movies = [Movie]()
    
    init() {
        Task { await fetchFeaturedMovies() }
    }
    
    @MainActor
    func fetchFeaturedMovies() async {
        self.movies = await MovieService.getFeaturedMovies()
    }
}
