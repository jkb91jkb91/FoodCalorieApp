//
//  ButtonClass.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-13.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

import  SnapKit
class StartView: UIView {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
      addConstraints()
        
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
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
    
    
    func addConstraints() {
        
        self.addSubview(button)

        
        button.snp.makeConstraints {[unowned self ] (make : ConstraintMaker) -> Void in
           make.top.equalToSuperview().offset(250)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
    

    
}

}
