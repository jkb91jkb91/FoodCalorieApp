//
//  AlertView.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-07.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation
import UIKit



class AlertView: UIView {
    
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let ProductName: UITextField = {
        let view = UITextField()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "PRODUCT NAME"
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()
    
    let Protein: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()
    
    let Carbohydrate: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()
    let Fats: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()
    
    let Namelabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()
    
    let Savebtn: UIButton = {
        let view = UIButton()
        view.layer.backgroundColor =  UIColor.green.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Save", for: .normal)
        view.tintColor = .white
        return view
    }()
    
    
    
    
}
