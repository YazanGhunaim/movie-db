//
//  TabBarView.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/7/23.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: Tab = .house
    @EnvironmentObject var viewModel: TabBarViewModel
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(Tab.house)
                    
                    ProfileView()
                        .tag(Tab.person)
                    
                    SearchView()
                        .tag(Tab.safari)
                }
            }
            if viewModel.showTabBar {
                VStack {
                    Spacer()
                    TabBar(selectedTab: $selectedTab)
                }
            }
        }
    }
}

#Preview {
    TabBarView()
}
