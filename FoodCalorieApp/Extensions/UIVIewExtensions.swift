//
//  UIVIewExtensions.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-10-23.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

extension UIView {
    
    
    func createLabel(text: String,font:Font,fontSize:FontSize) -> UILabel{
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.red.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.backgroundColor = .white
        view.text = text
        view.textColor = UIColor.black
        view.textAlignment = .center
        view.font = UIFont(name: Font.noteworthy.rawValue, size: CGFloat(FontSize.first.rawValue))
        return view
    }
    
    
    
    
    
}
