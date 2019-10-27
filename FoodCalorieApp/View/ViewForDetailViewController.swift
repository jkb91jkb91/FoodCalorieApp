//
//  ViewRepresantation.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-13.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//MARK:-Modules

import Foundation
import UIKit
import SnapKit

//MARK:-Class

class ViewForDetailViewController: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK:-UIElements
    
    let productField : UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = Products.product.rawValue
        view.isUserInteractionEnabled = true
        return view
    }()

    let calorieField : UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.keyboardType = .decimalPad
        view.placeholder = Products.calories.rawValue
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let proteinField : UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.keyboardType = .decimalPad
        view.placeholder = Products.protein.rawValue
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let carbField : UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.keyboardType = .decimalPad
        view.placeholder = Products.carbs.rawValue
        view.isUserInteractionEnabled = true
        return view
    }()

    let fatField : UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.keyboardType = .decimalPad
        view.placeholder = Products.fats.rawValue
        view.isUserInteractionEnabled = true
        return view
    }()

    let saveBtn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.setTitle(Placeholders.saveTitle.rawValue, for: .normal)
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    let backBtn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: ImageNames.BACK.rawValue), for: .normal)
        return view
    }()
    
//MARK:- Func-addConstraints
    
    func addConstraints() {
        addSubview(productField)
        addSubview(saveBtn)
        addSubview(calorieField)
        addSubview(proteinField)
        addSubview(carbField)
        addSubview(fatField)
        addSubview(backBtn)
        
        productField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-200)
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
        
        saveBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(80)
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
        
        calorieField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-150)
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
        
        proteinField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
  
        carbField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
        
        fatField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
  
        backBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
    }
}
