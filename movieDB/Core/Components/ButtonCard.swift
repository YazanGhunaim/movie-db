//
//  ButtonCard.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 9/30/23.
//

import SwiftUI

struct ButtonCard: View {
    let image: String
    let title: String
    
    /// Control Colors
    var isSelected = false
    
    var body: some View {
        Button {
            /// no action
        } label: {
            VStack(spacing: 0) {
                
                // MARK: SF Symbol
                Circle()
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 75)
                    .overlay (
                        Image(systemName: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.indigo.gradient)
                    )
                
                
                // MARK: Text under symbol
                Text(title)
                    .bold()
                    .foregroundStyle(isSelected ? .white : .black)
            }
            .frame(width: 100, height: 125)
            .background(isSelected ? .indigo : .buttonCardBackground)
            .clipShape(.rect(cornerRadius: 25))
        }
    }
}

#Preview {
    ButtonCard(image: "popcorn.fill", title: "Movies")
}
