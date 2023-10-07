//
//  NowShowingMoviesView.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/1/23.
//

import SwiftUI

struct NowShowingMoviesView: View {
    @StateObject var viewModel = NowShowingMoviesViewModel()
    
    var body: some View {
        VStack {
            // MARK: Now Showing Title and see all button
            header
            
            // MARK: Now showing movies scroll view
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.movies, id: \.id) { movie in
                        MovieCard(movie: movie)
                            .containerRelativeFrame(.horizontal)
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1.0 : 0.2)
                                    .scaleEffect(
                                        x: phase.isIdentity ? 1.0 : 0.3,
                                        y: phase.isIdentity ? 1.0 : 0.3
                                    )
                                    .offset(y: phase.isIdentity ? 0 : 100)
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(10, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

extension NowShowingMoviesView {
    var header: some View {
        HStack {
            Text("Now Showing")
                .font(.title2.bold())
            
            Spacer()
            
            Button("See All"){}
                .tint(.indigo)
                .bold()
        }
        .padding(.horizontal)
    }
}

#Preview {
    NowShowingMoviesView()
}
