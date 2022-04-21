//
//  Cocktail.swift
//  Test task
//
//  Created by Николай Циминтия on 30.03.2022.
//

import Foundation


struct CocktailData: Codable {
    var drinks: [Cocktail]
}


struct Cocktail: Codable {
    var strDrink: String
}

struct CocktailDescr: Codable {
    var strDrink: String
    var strInstructions: String
    var strDrinkThumb: String
}

struct CocktailDescrArray: Codable {
    var drinks: [CocktailDescr]
}
