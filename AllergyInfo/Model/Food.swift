//
//  Food.swift
//  AllergyInfo
//
//  Created by Nathan Smith on 2022-05-08.
//

import Foundation

struct Food: Decodable {
    let id: Int
    let title: String
    let image: String
}

let testFood = Food(id: 656791, title: "Pork Menudo", image: "https://spoonacular.com/recipeImages/656791-312x231.jpg")

/// https://api.spoonacular.com/recipes/complexSearch
