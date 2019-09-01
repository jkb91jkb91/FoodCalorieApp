//
//  View.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-13.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit





class  TableViews: UIView {
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createStackView(view1: UIView, view2: UIView, view3: UIView) -> UIStackView {
    
        let view = UIStackView(arrangedSubviews: [view1,view2,view3])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        
        return view
    }
    
    
    
    
let table: UITableView = {
    let tview = UITableView()
    tview.separatorStyle = .none
    tview.translatesAutoresizingMaskIntoConstraints = false
    tview.backgroundColor = UIColor.white
    return tview
}()
    
    let bottomView: UIView = {
    let view = UIView()
    view.layer.backgroundColor =  UIColor.green.cgColor
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
    view.setImage(UIImage(named: "unnamed"), for: .normal)
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOffset = CGSize(width: 0, height: 0)
    view.layer.shadowOpacity = 0.5
    return view
}()


let topView: UIView = {
    let view = UIView()
    view.layer.backgroundColor =  UIColor.green.cgColor
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
    view.font = UIFont(name: "Arial", size: 10)
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
    view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 16)
    view.text = "Protein:"
    view.textAlignment = .center
    view.textColor = .black
    return view
    
}()

let carblabel: UILabel = {
    let view = UILabel()
    view.layer.backgroundColor =  UIColor.clear.cgColor
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor.clear
    view.text = "Carbohydrate:"
    view.textAlignment = .center
    view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 16)
    view.textColor = .black
    return view
}()

let fatlabel: UILabel = {
    let view = UILabel()
    view.layer.backgroundColor =  UIColor.clear.cgColor
    view.backgroundColor = UIColor.clear
    view.translatesAutoresizingMaskIntoConstraints = false
    view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 16)
    view.text = "Fat:"
    view.textAlignment = .center
    view.textColor = .black
    return view
}()

let proteinLabelText: UILabel = {
    let view = UILabel()
    view.layer.backgroundColor =  UIColor.clear.cgColor
    view.translatesAutoresizingMaskIntoConstraints = false
    view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 16)
    view.text = "Protein:"
    view.textAlignment = .center
    view.textColor = .red
    return view
    
}()

let carbLabelText: UILabel = {
    let view = UILabel()
    view.layer.backgroundColor =  UIColor.clear.cgColor
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor.clear
    view.text = "Carbohydrate:"
    view.textAlignment = .center
    view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 16)
    view.textColor = .red
    return view
}()

let fatLabelText: UILabel = {
    let view = UILabel()
    view.layer.backgroundColor =  UIColor.clear.cgColor
    view.backgroundColor = UIColor.clear
    view.translatesAutoresizingMaskIntoConstraints = false
    view.font = UIFont(name: "HelveticaNeue-UltraLight", size: 16)
    view.text = "Fat:"
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
    view.text = "Press \"+\" button"
    view.textAlignment = .center
    view.textColor = .black
    view.font = UIFont(name: "Noteworthy-Bold", size: 30)
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
    view.font = UIFont(name: "AvenirNextCondensed-Bold", size:20)
    return view
}()

let arrowButton1: UIButton = {
    
    let view = UIButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    
    view.setImage(UIImage(named: "a"), for: .normal)
   
    return view
}()

let arrowButton2: UIButton = {
    
    let view = UIButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 50
    view.setImage(UIImage(named: "c"), for: .normal)
   
    return view
    
}()
    let date: UILabel  = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.text = "Kuba"
        
        return label
    }()
    
    
    
    
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
        
        table.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        table.trailingAnchor.constraint(equalTo: trailingAnchor, constant:   0).isActive = true
        table.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        table.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: 0).isActive = true
        
        bottomView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: bottomAnchor, constant:   0).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:   0).isActive = true
        
        topView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        topView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:   0).isActive = true
        
        button.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: -25).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        label.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
        label.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        stack.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -32).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stack.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0).isActive = true
        stack.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        
        stack2.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -2).isActive = true
        stack2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stack2.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0).isActive = true
        stack2.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        
        stack3.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: 0).isActive = true
        stack3.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: 0).isActive = true
        stack3.widthAnchor.constraint(equalToConstant: 300).isActive = true
        stack3.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    
    
    
}
