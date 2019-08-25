//
//  ViewRepresantation.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-13.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation
import UIKit

class ViewForDetailViewController: UIView {
    
    
    

let productField : UITextField = {
    let view = UITextField()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.placeholder = "Product"
    view.isUserInteractionEnabled = true
    return view
}()

let calorieField : UITextField = {
    let view = UITextField()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.keyboardType = .decimalPad
    view.placeholder = "Calories"
    view.isUserInteractionEnabled = true
    return view
}()


let proteinField : UITextField = {
    let view = UITextField()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.keyboardType = .decimalPad
    view.placeholder = "Protein"
    view.isUserInteractionEnabled = true
    return view
}()
let carbField : UITextField = {
    let view = UITextField()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.keyboardType = .decimalPad
    view.placeholder = "Carbohydrates"
    view.isUserInteractionEnabled = true
    return view
}()

let fatField : UITextField = {
    let view = UITextField()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.keyboardType = .decimalPad
    view.placeholder = "Fats"
    view.isUserInteractionEnabled = true
    return view
}()

let saveBtn: UIButton = {
    let view = UIButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .red
    view.setTitle("Save", for: .normal)
    view.layer.cornerRadius = 20
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOffset = CGSize(width: 0, height: 0)
    view.layer.shadowOpacity = 0.5
    
    
    
    return view
}()

let backBtn: UIButton = {
    let view = UIButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.setImage(UIImage(named: "BACK"), for: .normal)
    
    
    
    return view
}()

    
    
    
    
    
    
    
    
    
}
