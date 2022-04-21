//
//  TagButton.swift
//  Test task
//
//  Created by Николай Циминтия on 29.03.2022.
//

import UIKit
import Alamofire

class UITagButton: UIButton {
    var gradientLayer = CAGradientLayer()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        
        // Set gradientLayer
        let lowColor = CGColor(red: 233/255, green: 98/255, blue: 247/255, alpha: 1)
        let highColor = CGColor(red: 236/255, green: 95/255, blue: 102/255, alpha: 1)
        
        gradientLayer.colors = [highColor, lowColor]
        gradientLayer.cornerRadius = self.layer.cornerRadius
        gradientLayer.masksToBounds = false
        
        // Set background and cornerRadius
        self.backgroundColor = UIColor(red: 195/255, green: 195/255, blue: 195/255, alpha: 1)
       
        
        // Add tagButtonTapped target
        self.addTarget(self, action: #selector(tagButtonTapped(sender:)), for: .touchUpInside)
        }
    
    //MARK: - tagButtonTapped
    @objc func tagButtonTapped(sender: UITagButton) {
        if sender.layer.sublayers?.count == 1 {
            sender.setGradientLayer()
        } else {
            sender.setDefaultLayer()
        }
    }
    
    //MARK: - setDefaultLayer
    func setDefaultLayer() {
        if layer.sublayers!.count > 1 {
            layer.sublayers?.remove(at: 0)
        } else {
            
        }
    }
    
    //MARK: - setGradientLayer
    func setGradientLayer() {
        if gradientLayer.frame.isEmpty {
            gradientLayer.frame = self.bounds
        }
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

