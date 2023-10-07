//
//  Stars.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/2/23.
//

import SwiftUI

struct Stars: View {
    let rating: Double

    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                if index < Int(rating) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                } else if index == Int(rating) && rating.truncatingRemainder(dividingBy: 1) >= 0.5 {
                    Image(systemName: "star.leadinghalf.fill")
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

struct Stars_Previews: PreviewProvider {
    static var previews: some View {
        Stars(rating: 2.5)
    }
}


