//
//  Cell.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-11.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//MARK:-Modules

import UIKit
import SnapKit

//MARK:- Class

class ResultCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK:-UIElements
    
    var Namelabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Arial", size: 14)
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()
    
    var separatorView: UIView = {
        let view = UIView()
        view.layer.backgroundColor =  UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let calorielabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        view.text = "kCal:"
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()
    
    let proteinlabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        view.text = "Protein:"
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()
    
    let carblabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Carbohydrate:"
        view.textAlignment = .center
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        view.textColor = .black
        return view
    }()
    
    let fatlabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        view.text = "Fat:"
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()

    let calorieTextlabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        view.text = "kCal:"
        view.textAlignment = .center
        view.textColor = .red
        return view
    }()
    
    let proteinTextlabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        view.text = "Protein:"
        view.textAlignment = .center
        view.textColor = .red
        return view
    }()
    
    let carbTextlabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Carbohydrate:"
        view.textAlignment = .center
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        view.textColor = .red
        return view
    }()
    
    let fatTextlabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 12)
        view.text = "Fat:"
        view.textAlignment = .center
        view.textColor = .red
        return view
    }()

//MARK:-Functions
    
    func addConstraints() {
        addSubview(separatorView)
        addSubview(Namelabel)
        addSubview(calorielabel)
        addSubview(proteinlabel)
        addSubview(carblabel)
        addSubview(fatlabel)
        addSubview(calorieTextlabel)
        addSubview(proteinTextlabel)
        addSubview(carbTextlabel)
        addSubview(fatTextlabel)
      
        
        Namelabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(2)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.height.equalTo(30)
        }
 
        separatorView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(1)
        }
        
        calorielabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-20)
            make.leading.equalToSuperview().offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
       proteinlabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-20)
            make.leading.equalTo(calorielabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
      carblabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-20)
            make.leading.equalTo(proteinlabel.snp.trailing).offset(5)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
       fatlabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-20)
            make.leading.equalTo(carblabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
        calorieTextlabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-2)
            make.leading.equalToSuperview().offset(5)
            make.width.equalTo(70)
            make.height.equalTo(16)
        }
        
        proteinTextlabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-2)
            make.leading.equalTo(calorielabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(16)
        }
        
        carbTextlabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-2)
            make.leading.equalTo(proteinlabel.snp.trailing).offset(5)
            make.width.equalTo(100)
            make.height.equalTo(16)
        }
        
       fatTextlabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-2)
            make.leading.equalTo(carblabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(16)
        }
    }
    
    func updateResultCell(food: Food ) {
        
        if let lbl = food.label {
            self.Namelabel.text = lbl.uppercased()
        } else {
            self.Namelabel.text = ""
        }
        
        if let cal = food.nutrients.ENERC_KCAL {
            self.calorieTextlabel.text = String(cal.rounded())
        } else { self.calorieTextlabel.text = String(0)
            }
    
        if let prot = food.nutrients.PROCNT {
            self.proteinTextlabel.text = String(prot.rounded())
        } else {
            self.proteinTextlabel.text = String(0)
        }
        
        if let carb = food.nutrients.CHOCDF {
            self.carbTextlabel.text = String(carb.rounded())
        } else {
            self.carbTextlabel.text = String(0)
        }
      
        if let fat  = food.nutrients.FAT {
            self.fatTextlabel.text = String(fat.rounded())
            
        } else  {
                self.fatTextlabel.text = String(0)
            }
    }
}
