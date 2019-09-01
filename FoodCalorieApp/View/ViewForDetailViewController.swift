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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
         backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

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
    
    
    
    
    func addConstraints() {
        
       
      
        
        addSubview(productField)
        addSubview(saveBtn)
        addSubview(calorieField)
        addSubview(proteinField)
        addSubview(carbField)
        addSubview(fatField)
        addSubview(backBtn)
        
        productField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        productField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -200).isActive = true
        productField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        productField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        saveBtn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        saveBtn.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 80).isActive = true
        saveBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        saveBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        calorieField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        calorieField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150).isActive = true
        calorieField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        calorieField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        proteinField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        proteinField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100).isActive = true
        proteinField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        proteinField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        carbField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        carbField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50).isActive = true
        carbField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        carbField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        fatField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        fatField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        fatField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fatField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        backBtn.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        backBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 25).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
    }

}
