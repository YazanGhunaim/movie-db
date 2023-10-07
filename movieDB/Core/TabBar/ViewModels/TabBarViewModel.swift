//
//  TabBarViewModel.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/7/23.
//

import Foundation

class TabBarViewModel: ObservableObject {
    @Published var showTabBar: Bool = true
    
    func toggleTabBar() {
        showTabBar.toggle()
    }
}
