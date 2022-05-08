//
//  AllergyInfoApp.swift
//  AllergyInfo
//
//  Created by Nathan Smith on 2022-05-05.
//

import SwiftUI

@main
struct AllergyInfoApp: App {
    
    @State var favourites: [Food] = []
    
    var body: some Scene {
        WindowGroup {
            TabView {
                SearchView(favourites: $favourites)
                    .tabItem {
                        Image(systemName: "magnifyingglass.circle")
                        Text("Search")
                    }
                FavouritesListView()
                    .tabItem {
                        Image(systemName: "heart.text.square")
                        Text("Favourites List")
                    }
            }
        }
    }
}
