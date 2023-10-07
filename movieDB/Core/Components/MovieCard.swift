//
//  MovieCard.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/1/23.
//

import SwiftUI
import Kingfisher

struct MovieCard: View {
    let movie: Movie
    
    var body: some View {
        NavigationLink {
            MovieDetailsView(movieID: movie.id)
        } label: {
            ZStack(alignment: .bottomLeading) {
                // MARK: Movie Poster as a background
                KFImage(URL(string: "\(IMAGE_BASE_URL)\(movie.posterPath)"))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 300)
                    .offset(y: 60)
                    .clipShape(.rect(cornerRadius: 10))
                
                // MARK: Gradient effect on top of image
                Rectangle()
                    .foregroundStyle(.clear)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.clear, .indigo.opacity(0.8)])
                                       , startPoint: .top, endPoint: .bottom)
                    )
                
                // MARK: Movie Genre, Name and play button
                VStack(alignment: .leading, spacing: 10) {
                    genre
                    HStack {
                        title
                        Spacer()
                        PlayButton()
                    }
                }
                .padding(20)
            }
            .clipShape(.rect(cornerRadius: 25))
            .frame(width: 350, height: 300)
        }
        
    }
}

extension MovieCard {
    var title: some View {
        Text(movie.title)
            .font(.title)
            .foregroundStyle(.white)
            .multilineTextAlignment(.leading)
    }
    
    var genre: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(.white.opacity(0.3))
            .frame(width: 80, height: 40)
            .overlay (
                Text(genres[movie.genreIDs![0]] ?? "Unknown")
                    .font(.footnote)
                    .foregroundStyle(.white)
            )
    }
}


