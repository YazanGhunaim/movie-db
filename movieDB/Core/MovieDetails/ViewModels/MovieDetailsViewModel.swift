//
//  MovieDetailsViewModel.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/1/23.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    @Published var movie: Movie?
    
    var cast: [Cast] {
        movie?.credits?.cast ?? []
    }
    
    init(forID id: Int) {
        Task { await self.fetchDetails(forID: id) }
    }
    
    @MainActor
    func fetchDetails(forID id: Int) async {
        self.movie = await MovieService.getMovieDetails(forID: id)
    }
}
