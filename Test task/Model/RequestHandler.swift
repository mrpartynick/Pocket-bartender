//
//  Request.swift
//  Test task
//
//  Created by Николай Циминтия on 30.03.2022.
//

import Foundation
import Alamofire

struct RequestHandler {
    let url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"

    
    init() {

    }
    
    mutating func makeRequestForTagNames()  {
        AF.request(url).response { response in
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    let parseData = try decoder.decode(CocktailData.self, from: data)
                    CocktailViewController.cocktailNames = parseData.drinks
                } catch {
                    print("lol")
                }
            }

        }
    }
}



