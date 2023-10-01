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
        HStack {
            
            // MARK: Movie Poster
            KFImage(URL(string: "\(IMAGE_BASE_URL)\(movie.posterPath)"))
                .resizable()
                .scaledToFill()
                .frame(width: 85, height: 85)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // MARK: Movie Details
            VStack(alignment: .leading, spacing: 10) {
                // genre
                Text(genres[movie.genreIDs[0]] ?? "Unknown")
                    .font(.footnote.bold())
                    .foregroundStyle(.gray)
                
                // title
                Text(movie.title)
                    .font(.headline.bold())
                
                // MARK: Duration and rating
                durationAndRating
            }
        }
    }
}

extension MovieCell {
    var durationAndRating: some View {
        HStack {
            
            // duration
            Image(systemName: "calendar")
            Text("\(movie.releaseDate.convertToShortDateFormat().formatted(.dateTime.day().month().year()))")
                .foregroundStyle(.gray)
            
            Spacer()
            
            // rating
            HStack(spacing: 0) {
                Image(systemName: "star.fill")
                    .symbolRenderingMode(.multicolor)
                    .padding(.horizontal, 5)
                
                Text("\(movie.voteAverage.formatted())")
                    .foregroundStyle(Color.gold)
                
                // number of ratings
                Text("(\(movie.voteCount))")
                    .foregroundStyle(.gray)
            }
        }
        .font(.footnote)
    }
}


//#Preview {
//    MovieCell(movie: Movie(id: 0, voteAverage: 135, voteCount: Int(4.5), title: 420, brief: "Interstellar", posterPath: "Sample Description", releaseDate: "", genreIDs: "", adult: [0], runtime: [], genres: true))
//}
