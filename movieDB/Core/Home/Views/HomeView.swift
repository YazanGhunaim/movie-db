//
//  HomeView.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 9/30/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationStack {
                ScrollView {
                    VStack {
                        HomeHeaderView(userName: user.fullname)
                        
                        NowShowingMoviesView()
                            .scrollIndicators(.visible)
                        
                        ButtonCardsView()
                        
                        FeaturedMoviesView()
                            .padding(.horizontal)
                    }
                }
                .scrollIndicators(.hidden)
            }
        } else {
            ProgressView()
        }
    }
}

#Preview {
    HomeView()
}
