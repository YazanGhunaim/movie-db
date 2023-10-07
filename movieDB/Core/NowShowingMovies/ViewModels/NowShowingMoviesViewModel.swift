//
//  NowShowingMoviesViewModel.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/1/23.
//

import Foundation

class NowShowingMoviesViewModel: ObservableObject {
    @Published var movies = [Movie]()
    
    init() {
        Task { await fetchNowShowingMovies() }
    }
    
    @MainActor
    func fetchNowShowingMovies() async {
        self.movies = await MovieService.getNowShowingMovies()
    }
}
