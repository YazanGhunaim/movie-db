//
//  MovieCell.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 9/30/23.
//

import SwiftUI
import Kingfisher

struct MovieCell: View {
    let movie: Movie
    
    var body: some View {
        NavigationLink {
            MovieDetailsView(movieID: movie.id)
        } label: {
            HStack {
                // MARK: Movie Poster
                KFImage(URL(string: "\(IMAGE_BASE_URL)\(movie.posterPath)"))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 85, height: 85)
                    .offset(y: 15)
                    .clipShape(.rect(cornerRadius: 10))
                
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
                    
                    // MARK: Duration and rating
                    durationAndRating
                    
                    Divider()
                }
            }
        }
        
    }
}

extension MovieCell {
    var durationAndRating: some View {
        HStack {
            /// release date
            Image(systemName: "calendar")
            Text("\(movie.formattedDate)")
                .foregroundStyle(.dynamic(light: .gray, dark: .white))
                .bold()
            
            Spacer()
            
            /// rating
            HStack(spacing: 0) {
                Image(systemName: "star.fill")
                    .symbolRenderingMode(.multicolor)
                    .padding(.horizontal, 5)
                
                Text("\(movie.rating, specifier: "%.1f")")
                    .foregroundStyle(Color.gold)
                
                // number of ratings
                Text("(\(movie.voteCount))")
                    .foregroundStyle(.dynamic(light: .gray, dark: .white))
            }
        }
        .foregroundStyle(.dynamic(light: .black, dark: .white))
        .font(.footnote)
    }
}



