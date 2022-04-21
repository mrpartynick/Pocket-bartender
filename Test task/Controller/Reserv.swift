//////
//////  Reserv.swift
//////  Test task
//////
//////  Created by Николай Циминтия on 04.04.2022.
//////
////
////import Foundation
//////
//////  CocktailDescriptionViewController.swift
//////  Test task
//////
//////  Created by Николай Циминтия on 04.04.2022.
//////
////
////import UIKit
////import SnapKit
////
////class CocktailDescriptionViewController: UIViewController {
////
////    //MARK: - Some var's
////    static let cockTailImage = UIImage()
////    static let cocktailDescription = ""
////
////    static let cocktailImageView = UIImageView()
////    static let cocktailDescriptionLabel = UILabel()
////
////    //MARK: - viewDidLoad
////    override func viewDidLoad() {
////        super.viewDidLoad()
////
////        view.backgroundColor = .white
////
////        CocktailDescriptionViewController.cocktailDescriptionLabel.numberOfLines = 0
////
////        view.addSubview(CocktailDescriptionViewController.cocktailDescriptionLabel)
////        view.addSubview(CocktailDescriptionViewController.cocktailImageView)
////
////        CocktailDescriptionViewController.cocktailImageView.snp.makeConstraints { make in
////            make.top.equalToSuperview()
////            make.left.equalToSuperview()
////            make.right.equalToSuperview()
////            make.height.equalTo(self.view.center.y)
////        }
////
////        CocktailDescriptionViewController.cocktailDescriptionLabel.snp.makeConstraints { make in
////            make.top.equalTo(CocktailDescriptionViewController.cocktailImageView.snp.bottom)
////            make.bottom.equalToSuperview()
////            make.left.equalToSuperview()
////            make.right.equalToSuperview()
////        }
////
////    }
////
////
////}
//
//
////
////  NewRequestHandler.swift
////  Test task
////
////  Created by Николай Циминтия on 04.04.2022.
////
//
//import Foundation
//import Alamofire
//
//struct NetworkHandler {
//    let cocktailNamesURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"
//    let cocktailDescriptionURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
//    var delegate: NetworkHandlerDelegate?
//
//
//    func makeRequestForTagNames() {
//        let _ = AF.request(cocktailNamesURL).validate().responseDecodable(of: CocktailData.self) { (response) in
//            guard let cocktails = response.value else { return }
//            CocktailViewController.cocktailNames = cocktails.drinks
//            delegate!.viewInit()
//        }
//    }
//
//    func makeRequestForCocktailDescr(for name: String) {
//        var newName = name
//        if name.contains(" ") {
//            newName = replaceSpacingInName(name: name)
//        }
//
//        let url = cocktailDescriptionURL + newName
//        let _ = AF.request(url).validate().responseDecodable(of: CocktailDescrArray.self) { (response) in
//            guard let cocktail = response.value else { return }
//
//            let cocktailDecr = cocktail.drinks[0]
//
//            let imageURL = URL(string: cocktailDecr.strDrinkThumb)
//            if let data = try? Data(contentsOf: imageURL!) {
//                // Create Image and Update Image View
//                CocktailDescriptionViewController.cocktailImageView.image = UIImage(data: data)
//            }
//            CocktailDescriptionViewController.cocktailDescriptionLabel.text = cocktailDecr.strInstructions
//        }
//    }
//
//    func replaceSpacingInName(name: String) -> String {
//        let spaceSymbol = "%20"
//        var newName = ""
//
//        for symbol in name {
//            if symbol != " " {
//                newName += String(symbol)
//            } else {
//                newName += spaceSymbol
//            }
//        }
//
//        return newName
//    }
//}
//
//protocol NetworkHandlerDelegate {
//    func viewInit()
//}
