//
//  Cell.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-11.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit
import SnapKit

class CollectionCell: UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        addConstraints()
        
        
    }
    
 
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
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
    
    
    
    
    
    func addConstraints() {
        
        addSubview(Namelabel)
        addSubview(separatorView)
        
        addSubview(calorielabel)
        addSubview(proteinlabel)
        addSubview(carblabel)
        addSubview(fatlabel)
        
        
        addSubview(calorieTextlabel)
        addSubview(proteinTextlabel)
        addSubview(carbTextlabel)
        addSubview(fatTextlabel)
        
        
        
        Namelabel.snp.makeConstraints { (make) in
            make.topMargin.equalToSuperview().offset(2)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.height.equalToSuperview().offset(30)
        }
        
        /*
        Namelabel.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
        Namelabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        Namelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
        Namelabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        */
        
        
        separatorView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(1)
        }
        /*
         separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        */
        
        calorielabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-20)
            make.leading.equalToSuperview().offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
            
        }
        /*
        calorielabel.bottomAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: -20).isActive = true
        calorielabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        calorielabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        calorielabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        */
        
        proteinlabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-20)
            make.leading.equalTo(calorielabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        /*
        proteinlabel.bottomAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: -20).isActive = true
        proteinlabel.leadingAnchor.constraint(equalTo: calorielabel.trailingAnchor, constant: 5).isActive = true
        proteinlabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        proteinlabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        */
        
        carblabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-20)
            make.leading.equalTo(proteinlabel.snp.trailing).offset(5)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        /*
        carblabel.bottomAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: -20).isActive = true
        carblabel.leadingAnchor.constraint(equalTo: proteinlabel.trailingAnchor, constant: 5).isActive = true
        carblabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
       carblabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        */
        
        
        fatlabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-20)
            make.leading.equalTo(carblabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        /*
        fatlabel.bottomAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: -20).isActive = true
        fatlabel.leadingAnchor.constraint(equalTo: carblabel.trailingAnchor, constant: 5).isActive = true
        fatlabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        fatlabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        */
        
        
        calorieTextlabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-2)
            make.leading.equalToSuperview().offset(5)
            make.width.equalTo(70)
            make.height.equalTo(16)
        }
        /*
        calorieTextlabel.bottomAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: -2).isActive = true
        calorieTextlabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        calorieTextlabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        calorieTextlabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        */
        proteinTextlabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-2)
            make.leading.equalTo(calorielabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(16)
        }
        /*
        proteinTextlabel.bottomAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: -2).isActive = true
        proteinTextlabel.leadingAnchor.constraint(equalTo: calorielabel.trailingAnchor, constant: 5).isActive = true
        proteinTextlabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        proteinTextlabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        */
        carbTextlabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-2)
            make.leading.equalTo(proteinlabel.snp.trailing).offset(5)
            make.width.equalTo(100)
            make.height.equalTo(16)
            }
        /*
        carbTextlabel.bottomAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: -2).isActive = true
        carbTextlabel.leadingAnchor.constraint(equalTo: proteinlabel.trailingAnchor, constant: 5).isActive = true
        carbTextlabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        carbTextlabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        */
        
        fatTextlabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(separatorView.snp.bottom).offset(-2)
            make.leading.equalTo(carblabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(16)
        }
        /*fatTextlabel.bottomAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: -2).isActive = true
        fatTextlabel.leadingAnchor.constraint(equalTo: carblabel.trailingAnchor, constant: 5).isActive = true
        fatTextlabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        fatTextlabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        */
        
        
        
        
        
        
        
    }
    
    
    
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
    
    
    
    
    
}
