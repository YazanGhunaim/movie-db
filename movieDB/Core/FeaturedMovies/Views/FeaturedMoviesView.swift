//
//  FeaturedMoviesView.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 9/30/23.
//

import SwiftUI

struct FeaturedMoviesView: View {
    @StateObject var viewModel = FeaturedMoviesViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            /// title and see all button
            header
            
            /// featured movies 
            LazyVStack {
                ForEach(viewModel.movies, id: \.id) { movie in
                    MovieCell(movie: movie)
                        .padding(.vertical,2.5)
                }
            }
        }
    }
}

extension FeaturedMoviesView {
    var header: some View {
        HStack {
            Text("Featured Movies")
                .font(.title2.bold())
            
            Spacer()
            
            Button("See All"){}
                .tint(.indigo)
                .bold()
        }
    }
}

#Preview {
    FeaturedMoviesView()
}
