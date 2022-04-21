//  NewRequestHandler.swift
//  Test task
//
//  Created by Николай Циминтия on 04.04.2022.
//

import Foundation
import Alamofire

struct NetworkHandler {
    let cocktailNamesURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"
    let cocktailDescriptionURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
    var delegate: NetworkHandlerDelegate?


    func makeRequestForTagNames() {
        let _ = AF.request(cocktailNamesURL).validate().responseDecodable(of: CocktailData.self) { (response) in
            guard let cocktails = response.value else { return }
            CocktailViewController.cocktailNames = cocktails.drinks
            delegate!.viewInit()
        }
    }

    func makeRequestForCocktailDescr(for name: String) {
        var newName = name
        if name.contains(" ") {
            newName = replaceSpacingInName(name: name)
        }

        let url = cocktailDescriptionURL + newName
        let _ = AF.request(url).validate().responseDecodable(of: CocktailDescrArray.self) { (response) in
            guard let cocktail = response.value else { return }

            let cocktailDecr = cocktail.drinks[0]

            let imageURL = URL(string: cocktailDecr.strDrinkThumb)
            if let data = try? Data(contentsOf: imageURL!) {
                // Create Image and Update Image View
                CocktailDescriptionViewController.cocktailImageView.image = UIImage(data: data)
            }
            CocktailDescriptionViewController.cocktailDescriptionLabel.text = cocktailDecr.strInstructions
        }
    }

    func replaceSpacingInName(name: String) -> String {
        let spaceSymbol = "%20"
        var newName = ""

        for symbol in name {
            if symbol != " " {
                newName += String(symbol)
            } else {
                newName += spaceSymbol
            }
        }

        return newName
    }
}

protocol NetworkHandlerDelegate {
    func viewInit()
}
