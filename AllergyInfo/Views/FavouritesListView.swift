//
//  FavouritesListView.swift
//  AllergyInfo
//
//  Created by Nathan Smith on 2022-05-05.
//

import SwiftUI

struct FavouritesListView: View {
    
    // MARK: Stored Properties
    // custom fonts
    private static let fontNames: [String] = {
        var names = [String]()
        for familyName in UIFont.familyNames {
            names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
        }
        return names.sorted()
    }()
    
    // favourites list
    @Binding var favourites: [Food]
    
    // MARK: Computed Properties
    var body: some View {
        NavigationView {
            
            ZStack {
                // background of page
                Color("ListColour")
                    .ignoresSafeArea()
                
                // start of page
                VStack {
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "bookmark.slash.fill")
                                .resizable()
                                .frame(width: 35, height: 35, alignment: .center)
                                .onTapGesture {
                                    favourites.removeAll()
                                }
                            Text("Clear Favourites")
                                .font(.callout)
                        }
                        .padding(.trailing)
                        .padding(.top, 40)
                    }
                    .ignoresSafeArea()
                    
                        List(favourites, id: \.id) { currentFavourite in
                            ListItemView(food: currentFavourite)
                    }
                }
            }
        }
    }
}

struct FavouritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesListView(favourites: .constant(testList))
    }
}
