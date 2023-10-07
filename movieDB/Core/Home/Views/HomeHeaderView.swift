//
//  HomeHeaderView.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/1/23.
//

import SwiftUI

struct HomeHeaderView: View {
    let userName: String
    @State private var showSheet = false
    
    var body: some View {
        HStack {
            // MARK: User profile pic
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.indigo.gradient)
                .frame(width: 40, height: 40)
            
            // MARK: User greeting
            userWelcome
            
            Spacer()
            
            // MARK: Search Button
            Button {
                showSheet.toggle()
            } label: {
                Image(systemName: "magnifyingglass")
                    .tint(.black)
            }
        }
        .padding()
        .sheet(isPresented: $showSheet) {
            SearchView()
        }
    }
}

extension HomeHeaderView {
    var userWelcome: some View {
        VStack(alignment: .leading) {
            Text("Welcome Back!")
                .font(.footnote.bold())
                .foregroundStyle(.gray)
            
            HStack {
                Text(userName)
                    .bold()
                Text("👋")
            }
        }
    }
}

#Preview {
    HomeHeaderView(userName: "Yazan Ghunaim")
}
