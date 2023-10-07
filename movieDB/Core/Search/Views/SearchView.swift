//
//  SearchView.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/7/23.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.filteredMovies, id: \.id) { movie in
                NavigationLink {
                    MovieDetailsView(movieID: movie.id, showBackButton: false)
                } label: {
                    HStack {
                        // MARK: Movie Poster
                        KFImage(URL(string: "\(IMAGE_BASE_URL)\(movie.posterPath)"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(.rect(cornerRadius: 15))
                        
                        // MARK: Movie Details
                        VStack(alignment: .leading, spacing: 10) {
                            /// genre
                            Text(genres[movie.genreIDs![0]] ?? "Unknown")
                                .font(.footnote.bold())
                                .foregroundStyle(.dynamic(light: .gray, dark: .white))
                            
                            /// title
                            Text(movie.title)
                                .foregroundStyle(.dynamic(light: .black, dark: .white))
                                .font(.headline.bold())
                        }
                    }
                }
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $viewModel.searchTerm, prompt: "Search for a movie!")
        }
    }
}

#Preview {
    SearchView()
}
