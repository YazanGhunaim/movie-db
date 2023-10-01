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
    
    var isSelected = false
    
    var body: some View {
        Button {
            // no action
        } label: {
            VStack(spacing: 25) {
                
                // MARK: SF Symbol
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .tint(.indigo)
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 75)
                    )
                
                // MARK: Text under symbol
                Text(title)
                    .bold()
                    .foregroundStyle(isSelected ? .white : .black)
            }
            .frame(width: 100, height: 125)
            .background(isSelected ? .indigo : .buttonCardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}

#Preview {
    ButtonCard(image: "popcorn.fill", title: "Movies")
}
