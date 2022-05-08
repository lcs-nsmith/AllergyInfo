//
//  SearchView.swift
//  AllergyInfo
//
//  Created by Nathan Smith on 2022-05-05.
//

import SwiftUI

struct SearchView: View {
    // MARK: Stored Properties
    
    // What is being searched
    @State var searchInput: String = ""
    
    // List of Foods from ***
    @State var foodsParsed: [Food] = [] // starts the array empty
    
    // favourites list
    @Binding var favourites: [Food]
    
    // MARK: Computed Properties
    var body: some View {
        NavigationView {
            ZStack {
                // background of page
                Color("ListColour")
                    .ignoresSafeArea()
                VStack {
                    
                    // search field
                    ZStack {
                        TextField("horse",
                                  text: $searchInput,
                                  prompt: Text("Enter the name of a potential allergen"))
                        .cornerRadius(10)
                        .background(Color("ListColour"))
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 4))
                        .foregroundColor(.primary)
                        .accentColor(.secondary)
                        .padding()
                        
                        HStack {
                            Spacer(minLength: 340)
                            Image(systemName: "magnifyingglass.circle")
                                .foregroundColor(Color(UIColor.systemGray2))
                            Spacer()
                        }
                    }
                    
                    
                    // iterates list of foods being retreived
                    List(foodsParsed, id: \.self) { currentFood in
                        ProgressView()
                    }
                }
            }
            .navigationTitle("Allergen Finder")
        }
        
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(favourites: .constant([testFood]))
    }
}
