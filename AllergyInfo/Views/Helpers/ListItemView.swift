//
//  ListItemView.swift
//  AllergyInfo
//
//  Created by Nathan Smith on 2022-05-12.
//

import SwiftUI

struct ListItemView: View {
    // MARK: Stored Properties
    var food: Food
    
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
        HStack() {
            
            Text(food.title)
                .font(Font.custom("Didot-Bold", size: 18))
                
            
            RemoteImageView(fromURL: URL(string: food.image)!)
            
        }

    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(food: testFood)
    }
}
