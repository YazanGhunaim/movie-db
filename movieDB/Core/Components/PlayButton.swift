//
//  PlayButton.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/1/23.
//

import SwiftUI

struct PlayButton: View {
    var body: some View {
        Circle()
            .frame(width: 50, height: 50)
            .foregroundStyle(.white)
            .overlay (
                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.indigo.gradient)
            )
    }
}

#Preview {
    PlayButton()
}
