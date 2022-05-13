//
//  DetailView.swift
//  AllergyInfo
//
//  Created by Nathan Smith on 2022-05-12.
//

import SwiftUI

struct DetailView: View {
    // MARK: Stored Properties
    
    var food: Food
    
    @Binding var favourites: [Food]
    
    // custom fonts
    private static let fontNames: [String] = {
        var names = [String]()
        for familyName in UIFont.familyNames {
            names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
        }
        return names.sorted()
    }()
    
    
    // MARK: Computed Properties
    var body: some View {
        NavigationView {
            
            ZStack {
                // background of page
                Color("ListColour")
                    .ignoresSafeArea()
                
                // start of page
                VStack {
                    HStack (spacing: 36){
                        Text(food.title)
                            .font(Font.custom("Didot", size: 18))
                        ZStack {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 35, alignment: .center)
                                .opacity(favourites.contains(where: { currentItemInList in
                                    return currentItemInList.id == food.id
                                }) == true ? 1.0 : 0.0)
                            Image(systemName: "bookmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 35, alignment: .center)
                                .opacity(favourites.contains(where: { currentItemInList in
                                    return currentItemInList.id == food.id
                                }) == false ? 1.0 : 0.0)
                                .onTapGesture {
                                    if favourites.contains(where: { currentItemInList in
                                        return currentItemInList.id == food.id
                                    }) == false {
                                        favourites.append(food)
                                    }
                                }
                        }
                        .animation(.linear)
                    }
                    .padding(46)
                    .offset(x: 0, y: -20)
                    Spacer()
                    RemoteImageView(fromURL: URL(string: food.image)!)
                        .scaleEffect(6.5)
                        .padding(.bottom, 200)
                    Spacer()
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(food: testFood, favourites: .constant(testList))
    }
}
