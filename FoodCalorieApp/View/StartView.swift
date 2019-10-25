//
//  ButtonClass.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-13.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//MARK:-Modules

import UIKit
import SnapKit

//MARK:-Class

class StartView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addConstraints()
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
//MARK:-UIElements
    
    let label: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.red.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.backgroundColor = .white
        view.text = Placeholders.startViewText.rawValue
        view.textColor = UIColor.black
        view.textAlignment = .center
        view.font = UIFont(name: Font.noteworthy.rawValue, size: CGFloat(FontSize.first.rawValue))
        return view
        }()
 
    
//MARK:-Function-addConstraints
    
    func addConstraints() {
        self.addSubview(label)
        label.snp.makeConstraints { (make) in
        make.top.equalToSuperview().offset(250)
        make.centerX.equalToSuperview()
        make.width.equalTo(300)
        make.height.equalTo(50)
        }
   }
}
