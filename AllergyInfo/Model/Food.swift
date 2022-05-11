//
//  Food.swift
//  AllergyInfo
//
//  Created by Nathan Smith on 2022-05-08.
//

import Foundation

struct Food: Decodable, Hashable {
    let query: String
    let intolerances: String
}

let testFood = Food(query: "pasta", intolerances: "Sesame")

/// https://api.spoonacular.com/recipes/complexSearch
