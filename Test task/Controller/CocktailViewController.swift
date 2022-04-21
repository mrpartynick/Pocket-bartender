//
//  ViewController.swift
//  Test task
//
//  Created by Николай Циминтия on 29.03.2022.
//

// Разобраться с ебаным выделением тегов при работе с textField.

import UIKit
import SnapKit

class CocktailViewController: UIViewController, NetworkHandlerDelegate {
    
    //MARK: - Some var's
    var tagButtonsArray = [UITagButton]()
    static var cocktailNames = [Cocktail]()
    var networkHandler = NetworkHandler()
    var cocktailNameTextField: UITextField = {
    
        let textField = UITextField()
        
        textField.borderStyle = .roundedRect
        textField.placeholder = "Cocktail name"
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 7
        textField.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        textField.layer.shadowOpacity = 0.5
        
        return textField
    }()

    //MARK: - View did load
    override func viewDidLoad() {

        // Set the main view
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Set textField delegates
        cocktailNameTextField.delegate = self
        
        // Set a networkHandler and make request
        networkHandler.delegate = self
        networkHandler.makeRequestForTagNames()
    }
    
    //MARK: - View Init
    func viewInit() {
        // Инициализация кнопочек.
        tagButtonsInit()
        
        // Настройка cocktailNameTextField.
        cocktailNameTextField.addTarget(self, action: #selector(coctailNameTextFieldEditing(sender: )), for: .editingChanged)
        self.view.addSubview(cocktailNameTextField)
        
        // Задаем констрейнты.
        setConstraints()
    }
    
    //MARK: - Tag buttons init
    func tagButtonsInit() {
        
        // Переменная, которая будет указывать на предыдущую кнопку, чтобы на основании ее trailing установить leading у текущей кнопки.
        var previosButtonIndex = -1
        // Переменная, хранящая ширину основного view.
        let widthOfMainView = Int(self.view.frame.width)
        // Переменная, хранящая ширину текущей линии, состоящей из тегов. Используется для того, чтобы, исходя из результатов сравнения с шириной основного view, перейти на новую строку.
        var currentSizeOfLine = 0
        // Индекс первой кнопки в линии. Нужен для того, чтобы относительно этой кнопки выстраивать constraints при переходе на новую линию.
        var firstButtonInLineIndex = 0
        
        for cocktailName in CocktailViewController.cocktailNames {
            let tagButton = UITagButton()
            
            tagButton.setTitle(cocktailName.strDrink, for: .normal)
            tagButton.titleLabel?.font = UIFont(name: "Times New Roman", size: 14)
            tagButton.addTarget(self, action: #selector(tagButtonTouched(sender:)), for: .touchUpInside)

            tagButtonsArray.append(tagButton)
            self.view.addSubview(tagButton)
            
            let widthOfButton = Int(tagButton.intrinsicContentSize.width)
            currentSizeOfLine += widthOfButton + 8
            
            if currentSizeOfLine >= widthOfMainView-5 {
                setConstraintForButton(for: tagButton, previosButtonIndex: nil, firstButtonInLineIndex: firstButtonInLineIndex)
                // Текущая кнопка становится первой в линии.
                firstButtonInLineIndex = previosButtonIndex + 1
                currentSizeOfLine = widthOfButton + 8
            // Иначе мы просто устанвливаем constraints для текущей кнопки, отталкиваясь от предыдущей.
            } else {
                setConstraintForButton(for: tagButton, previosButtonIndex: previosButtonIndex, firstButtonInLineIndex: nil)
            }
            
            previosButtonIndex += 1
        }
        
    }
    
    @objc func tagButtonTouched(sender: UITagButton) {
        let destinationVC = CocktailDescriptionViewController()
        networkHandler.makeRequestForCocktailDescr(for: sender.title(for: .normal)!)

        self.present(destinationVC, animated: true) {
        }
    }
    
    //MARK: - coctailNameTextFieldEditing
    @objc func coctailNameTextFieldEditing(sender: UITextField) {
        let text = sender.text!
        for tag in tagButtonsArray {
            if tag.title(for: .normal)!.contains(text) {
                tag.setGradientLayer()
            } else {
                tag.setDefaultLayer()
            }
            if text == ""{
                tag.setDefaultLayer()
            }
        }
    }

    //MARK: - Set Constraints For Buttons
    func setConstraintForButton(for button: UIButton, previosButtonIndex: Int?, firstButtonInLineIndex: Int?) {

        // Значит мы не переходим на новый ряд.
        if let previosButtonIndex = previosButtonIndex {
            // Значит наша кнопка - первая.
            if previosButtonIndex == -1 {
                button.snp.makeConstraints { make in
                    make.top.equalTo(button.superview!.snp_topMargin)
                    make.leading.equalTo(button.superview!.snp.leadingMargin)
                }
            // Значит наша кнопка не первая.
            } else {
                button.snp.makeConstraints { make in
                    make.leading.equalTo(tagButtonsArray[previosButtonIndex].snp.trailing).offset(8)
                    make.top.equalTo(tagButtonsArray[previosButtonIndex])
                }
            }

        }
        // Переходим на новый ряд.
        if let firstButtonInLineIndex = firstButtonInLineIndex {
            button.snp.makeConstraints { make in
                make.top.equalTo(tagButtonsArray[firstButtonInLineIndex].snp.bottom).offset(8)
                make.leading.equalTo(button.superview!.snp.leadingMargin)
            }
        }
    }
    
    //MARK: - Set constraints
    func setConstraints() {
        cocktailNameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.snp_bottomMargin)
        }
    }
}

//MARK: - UITextField delegate
extension CocktailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Setting the textField, when the editing began.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.snp.remakeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    // Setting the textField, when the editing finished.
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.snp_bottomMargin)
        }
    }
}
