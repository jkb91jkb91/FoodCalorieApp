//
//  View.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-13.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit





class  TcV: UIView {
    
    
    
    
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
    view.text = "Kuba"
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
    
    
    
    
    
    
    
    
    
}
