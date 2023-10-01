//
//  HomeView.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 9/30/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ButtonCardsView()
                
                FeaturedMoviesView()
            }
            .padding()
            .ignoresSafeArea()
            
        }
    }
}

#Preview {
    HomeView()
}
