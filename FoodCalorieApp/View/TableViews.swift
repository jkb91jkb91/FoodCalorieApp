//
//  View.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-13.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//MARK:- Modules

import UIKit

//MARK:-Class

class  TableViews: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK:UIElements
         
    let table: UITableView = {
        let tview = UITableView()
        tview.separatorStyle = .none
        tview.translatesAutoresizingMaskIntoConstraints = false
        tview.backgroundColor = UIColor(displayP3Red: 248/255, green: 197/255, blue: 148/255, alpha: 1)
        return tview
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.layer.backgroundColor =  UIColor.orange.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    let button: UIButton = {
        let view = UIButton()
        view.layer.backgroundColor =  UIColor.red.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.setImage(UIImage(named: ImageNames.unnamed.rawValue), for: .normal)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.layer.backgroundColor =  UIColor.orange.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    let label: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.text = String(0)
        view.font = UIFont(name: Font.arial.rawValue, size: CGFloat(FontSize.verySmall.rawValue))
        view.textAlignment = .center
        view.textColor = .black
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.5
        return view
    }()

    let proteinlabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.clear.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: Font.helvetica.rawValue, size: CGFloat(FontSize.medium.rawValue))
        view.text = MacroNames.protein.rawValue
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()

    let carblabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.clear.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        view.text = MacroNames.carbs.rawValue
        view.textAlignment = .center
        view.font = UIFont(name: Font.helvetica.rawValue, size: CGFloat(FontSize.medium.rawValue))
        view.textColor = .black
        return view
    }()

    let fatlabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.clear.cgColor
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: Font.helvetica.rawValue, size: CGFloat(FontSize.medium.rawValue))
        view.text = MacroNames.fat.rawValue
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()

    let proteinLabelText: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.clear.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: Font.helvetica.rawValue, size:CGFloat(FontSize.medium.rawValue))
        view.text = MacroNames.protein.rawValue
        view.textAlignment = .center
        view.textColor = .red
        return view
    }()

    let carbLabelText: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.clear.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        view.text = MacroNames.carbs.rawValue
        view.textAlignment = .center
        view.font = UIFont(name: Font.helvetica.rawValue, size: CGFloat(FontSize.medium.rawValue))
        view.textColor = .red
        return view
    }()

    let fatLabelText: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.clear.cgColor
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: Font.helvetica.rawValue, size: CGFloat(FontSize.medium.rawValue))
        view.text = MacroNames.fat.rawValue
        view.textAlignment = .center
        view.textColor = .red
        return view
    }()

    let pulsingLabel: UILabel = {
        let view = UILabel()
        view.layer.backgroundColor =  UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.text = Placeholders.pulsingLabel.rawValue
        view.textAlignment = .center
        view.textColor = .black
        view.font = UIFont(name: Font.noteworthy.rawValue, size: CGFloat(FontSize.first.rawValue))
        return view
    }()

    let dateLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        view.backgroundColor = .clear
        view.text = ""
        view.textAlignment = .center
        view.textColor = .white
        view.font = UIFont(name: Font.avenir.rawValue, size: CGFloat(FontSize.medium.rawValue))
        return view
    }()

    let arrowButton1: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: ImageNames.a.rawValue), for: .normal)
        return view
    }()

    let arrowButton2: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        view.setImage(UIImage(named: ImageNames.c.rawValue), for: .normal)
        return view
    }()
    
    let date: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.text = ""
        return label
    }()
    
//MARK:-Functions
    
    func createStackView(view1: UIView, view2: UIView, view3: UIView) -> UIStackView {
           let view = UIStackView(arrangedSubviews: [view1,view2,view3])
           view.translatesAutoresizingMaskIntoConstraints = false
           view.axis = .horizontal
           view.distribution = .fillEqually
           return view
       }
        
    func addConstraints() {
        let stack = createStackView(view1: proteinlabel, view2: carblabel, view3: fatlabel)
        let stack3 = createStackView(view1: arrowButton2, view2: dateLabel, view3: arrowButton1)
        let stack2 = createStackView(view1: proteinLabelText, view2: carbLabelText, view3: fatLabelText)
        addSubview(table)
        addSubview(bottomView)
        addSubview(button)
        addSubview(topView)
        addSubview(label)
        addSubview(stack)
        addSubview(stack2)
        addSubview(stack3)
        
        table.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.height.equalTo(70)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        topView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(160)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        button.snp.makeConstraints { (make) in
            make.top.equalTo(bottomView.snp.top).offset(-25)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
        stack.snp.makeConstraints { (make) in
            make.bottom.equalTo(topView.snp.bottom).offset(-32)
            make.height.equalTo(20)
            make.leading.equalTo(topView.snp.leading)
            make.trailing.equalTo(topView.snp.trailing)
        }
        
        stack2.snp.makeConstraints { (make) in
            make.bottom.equalTo(topView.snp.bottom).offset(-2)
            make.height.equalTo(20)
            make.leading.equalTo(topView.snp.leading)
            make.trailing.equalTo(topView.snp.trailing)
        }
        
        stack3.snp.makeConstraints { (make) in
            make.centerX.equalTo(bottomView.snp.centerX)
            make.centerY.equalTo(bottomView.snp.centerY)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
    }
}
