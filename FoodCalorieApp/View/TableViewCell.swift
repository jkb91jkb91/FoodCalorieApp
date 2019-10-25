//
//  TableViewCell.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-07.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//MARK:-Modules

import UIKit

//MARK:-Class

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addConstraints()
      }
    
//MARK:-UI elements
    
    let mainView: UIView = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    let iView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: ImageNames.food.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()
    
    let calorielabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: Font.helvetica.rawValue, size: CGFloat(FontSize.small.rawValue))
        view.text = MacroNames.kal.rawValue
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()
    
    let proteinlabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: Font.helvetica.rawValue, size: CGFloat(FontSize.small.rawValue))
        view.text = MacroNames.protein.rawValue
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()
    
    let carblabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = MacroNames.carbs.rawValue
        view.textAlignment = .center
        view.font = UIFont(name: Font.helvetica.rawValue, size: CGFloat(FontSize.small.rawValue))
        view.textColor = .black
        return view
    }()
    
    let fatlabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: Font.helvetica.rawValue, size: CGFloat(FontSize.small.rawValue))
        view.text = MacroNames.fat.rawValue
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()

    let proteinLabelText: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: Font.helvetica.rawValue, size: CGFloat(FontSize.small.rawValue))
        view.textColor = .red
        view.textAlignment = .center
        return view
    }()
    
    let carbLabelText: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .red
        view.textAlignment = .center
        view.font = UIFont(name: Font.helvetica.rawValue, size: CGFloat(FontSize.small.rawValue))
        return view
    }()
    
    let fatLabelText: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: Font.helvetica.rawValue, size: CGFloat(FontSize.small.rawValue))
        view.textColor = .red
        view.textAlignment = .center
        return view
    }()
    
//MARK:- Func-adding constraints
    
    func addConstraints() {
        addSubview(mainView)
        mainView.addSubview(nameLabel)
        mainView.addSubview(iView)
        mainView.addSubview(proteinlabel)
        mainView.addSubview(carblabel)
        mainView.addSubview(fatlabel)
        mainView.addSubview(calorielabel)
        mainView.addSubview(proteinLabelText)
        mainView.addSubview(carbLabelText)
        mainView.addSubview(fatLabelText)
        
        mainView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
       
        iView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
    
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(1)
            make.leading.equalTo(iView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.height.equalTo(30)
        }
      
        calorielabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
     
        proteinlabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(iView.snp.trailing).offset(10)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
       
        carblabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(proteinlabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
     
        fatlabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(carblabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
       
        proteinLabelText.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalTo(iView.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
        
        carbLabelText.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalTo(proteinlabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
       
        fatLabelText.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalTo(carblabel.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(20)
        }
    }
    
//MARK:-Function
    
    func updateCell(meal: Meals) {
        nameLabel.text = meal.productField?.uppercased()
        calorielabel.text = String(meal.calorieField).uppercased()
        proteinLabelText.text = String(meal.proteinField).uppercased()
        carbLabelText.text = String(meal.carbField).uppercased()
        fatLabelText.text = String(meal.fatField).uppercased()
    }
}


