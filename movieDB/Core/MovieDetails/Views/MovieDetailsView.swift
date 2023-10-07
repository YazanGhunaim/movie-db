//
//  MovieDetailsView.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/1/23.
//

import SwiftUI
import Foundation
import Kingfisher

struct MovieDetailsView: View {
    let movieID: Int
    let showBackButton: Bool
    
    @StateObject var viewModel : MovieDetailsViewModel
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var tabBarViewModel: TabBarViewModel
    
    /// dependency injection
    init(movieID: Int, showBackButton: Bool = true) {
        self.movieID = movieID
        self.showBackButton = showBackButton
        self._viewModel = StateObject(wrappedValue: MovieDetailsViewModel(forID: movieID))
    }
    
    var body: some View {
        /// unwrapping the movie object in the view model
        if viewModel.movie != nil {
            VStack(alignment: .leading) {
                // MARK: Movie Poster Background along side title and star ratings
                moviePosterAndTitle
                
                movieDetailBody
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
            .onAppear { tabBarViewModel.toggleTabBar() }
            .onDisappear { tabBarViewModel.toggleTabBar() }
        } else {
            ProgressView()
                .navigationBarBackButtonHidden()
        }
    }
}

extension MovieDetailsView {
    var moviePosterAndTitle: some View {
        ZStack {
            // MARK: Movie Poster as a background
            KFImage(URL(string: "\(IMAGE_BASE_URL)\(viewModel.movie!.posterPath)"))
                .resizable()
                .scaledToFill()
                .offset(y: 20)
                .frame(height: 450)
                .clipShape(.rect(cornerRadius: 0))
            
            // MARK: Gradient effect on top of image
            Rectangle()
                .foregroundStyle(.clear)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.clear, .indigo.opacity(0.8)])
                                   , startPoint: .top, endPoint: .bottom)
                )
                .frame(height: 450)
                .clipShape(.rect(cornerRadius: 0))
            
            
            // MARK: BackButton, Movie Genre, Name and play button
            VStack(alignment: .leading, spacing: 5) {
                if showBackButton {
                    Button {
                        dismiss()
                    } label: {
                        BackButton()
                            .offset(x: 15, y: 25)
                    }
                }
                
                Spacer()
                Text(viewModel.movie!.title)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Text("\(viewModel.movie!.rating, specifier: "%.1f")")
                        .foregroundStyle(.white)
                    Stars(rating: viewModel.movie!.rating)
                    Spacer()
                    PlayButton()
                }
            }
            .padding(20)
        }
    }
    
    var movieDetailTile: some View {
        HStack {
            Image(systemName: "calendar")
            Text(viewModel.movie!.formattedDate)
                .foregroundStyle(.gray)
                .bold()
            
            Spacer()
            
            Image(systemName: "clock.fill")
            Text("\(viewModel.movie!.runtime ?? 165) Minutes")
                .foregroundStyle(.gray)
                .bold()
            
            Spacer()
            
            Image(systemName: "film.fill")
            Text(viewModel.movie?.genres?[0].name ?? "Unknown")
                .foregroundStyle(.gray)
                .bold()
        }
        .padding()
        .padding(.vertical, 10)
        .font(.footnote)
        .background(.indigo.opacity(0.07))
        .clipShape(.rect(cornerRadius: 50))
    }
    
    var cast: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.cast, id: \.id) { actor in
                    VStack(spacing: 5) {
                        if let path = actor.profilePath {
                            KFImage(URL(string: "\(IMAGE_BASE_URL)\(path)"))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 75, height: 75)
                                .clipShape(Circle())
                        } else {
                            Circle()
                                .frame(width: 75, height: 75)
                        }
                        
                        Text(actor.name)
                            .font(.caption)
                    }
                    .containerRelativeFrame(.horizontal, count: 3, spacing: 10.0)
                    .scrollTransition { content, phase in
                        content
                            .opacity(phase.isIdentity ? 1.0 : 0.2)
                            .scaleEffect(
                                x: phase.isIdentity ? 1.0 : 0.3,
                                y: phase.isIdentity ? 1.0 : 0.3
                            )
                            .offset(y: phase.isIdentity ? 0 : 50)
                    }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(10, for: .scrollContent)
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.hidden)
    }
    
    var movieDetailBody: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                // MARK: Release Date, Duration and genre
                movieDetailTile
                    .padding()
                
                // MARK: Plot Text and Cast and Crew Title
                VStack(alignment: .leading, spacing: 10) {
                    Text("The Plot")
                        .font(.title.bold())
                    
                    Text(viewModel.movie!.brief)
                        .bold()
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    Text("Cast and Crew")
                        .font(.title.bold())
                }
                .padding(.horizontal)
                
                // MARK: Cast scroll view
                cast
            }
        }
    }
}

#Preview {
    MovieDetailsView(movieID: 762430)
}
