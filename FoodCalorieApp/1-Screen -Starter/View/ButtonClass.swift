//
//  ButtonClass.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-13.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

class View: UIView {

        
        let button: UILabel = {
            let view = UILabel()
            view.layer.backgroundColor =  UIColor.red.cgColor
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 25
            view.clipsToBounds = true
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.white.cgColor
            view.backgroundColor = .white
            view.text = "Count Your Macros"
            view.textColor = UIColor.black
            view.textAlignment = .center
            view.font = UIFont(name: "Noteworthy-Bold", size: 30)
            return view
        }()
        
        
        

    
}
