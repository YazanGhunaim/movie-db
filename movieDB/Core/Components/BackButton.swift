//
//  BackButton.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/1/23.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        Circle()
            .foregroundStyle(.gray.opacity(0.3))
            .frame(width: 50, height: 75)
            .overlay (
                Image(systemName: "arrow.backward")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(.white)
            )
    }
}

#Preview {
    BackButton()
}
