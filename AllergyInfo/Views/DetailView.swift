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
                        Text(food.title)
                            .font(Font.custom("Didot", size: 34))
                            .padding(.bottom, 120)
                    
                    RemoteImageView(fromURL: URL(string: food.image)!)
                        .scaleEffect(8)
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
