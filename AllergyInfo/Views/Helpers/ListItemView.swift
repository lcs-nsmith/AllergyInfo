//
//  ListItemView.swift
//  AllergyInfo
//
//  Created by Nathan Smith on 2022-05-12.
//

import SwiftUI

struct ListItemView: View {
    
    var food: Food
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(food.title)
            
            RemoteImageView(fromURL: URL(string: food.image)!)
            
        }

    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(food: testFood)
    }
}
