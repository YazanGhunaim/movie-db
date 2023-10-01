//
//  ButtonCardsView.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 9/30/23.
//

import SwiftUI

struct ButtonCardsView: View {
    var body: some View {
        HStack(spacing: 20) {
            ButtonCard(image: "film.stack.fill", title: "Genre")
            
            ButtonCard(image: "popcorn.fill", title: "Movies", isSelected: true)
            
            ButtonCard(image: "star.fill", title: "Go pro")
        }
        .padding(.vertical, 25)
    }
}

#Preview {
    ButtonCardsView()
}
