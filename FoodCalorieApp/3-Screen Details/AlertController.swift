//
//  AlertController2.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-07.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit


class AlertController: UIView {
    
    
        
        let alertViewInstance = AlertView()
        static let alertController = AlertController()
        
        
        
        
        
        
        @IBOutlet var parentView: UIView!
        @IBOutlet weak var mainView: UIView!
        @IBOutlet weak var alertView: UIView!
        @IBOutlet weak var topButton: UIButton!
        @IBOutlet weak var bottomButton: UIButton!
        @IBOutlet weak var CenterY: NSLayoutConstraint!
        
        @IBOutlet weak var height: NSLayoutConstraint!
        
        override init(frame: CGRect) {
            super.init(frame:frame)
            
            
            Bundle.main.loadNibNamed("Alert", owner: self, options: nil)
            self.setApparance()
            UIApplication.shared.keyWindow?.addSubview(self.parentView)
            self.bottomButton.addTarget(self, action: #selector(self.showFields), for: .touchUpInside)
            
            
            
            
        }
    
    override func didMoveToSuperview() {
        Bundle.main.loadNibNamed("Alert", owner: self, options: nil)
        self.setApparance()
        //UIApplication.shared.keyWindow?.addSubview(self.parentView)
    }
    
    
    
        
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        func setApparance() {
            
            alertView.layer.cornerRadius = 5
            topButton.layer.cornerRadius = 5
            bottomButton.layer.cornerRadius = 5
            parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            
            topButton.backgroundColor = .red
            bottomButton.backgroundColor = .red
            
            
            
            
       
            
        
        
        
    }
        
        @objc func showFields() {
            
            self.layoutIfNeeded()
            UIView.animate(withDuration: 3) {
                
                self.height.constant = 250
                self.CenterY.constant = -300
                self.createInputViews()
            }
            
        }
        
        
        
        func addConstraints() {
            
            let protein = alertViewInstance.Protein
            let carb = alertViewInstance.Carbohydrate
            let fat = alertViewInstance.Fats
            
            
            
            
            
            
            //addSubview(protein)
            //addSubview(carb)
            //addSubview(fat)
            
            
        }
        
        
        func createInputViews() {
            
            
            let save = self.alertViewInstance.Savebtn
            self.alertView.addSubview(save)
            
            
            save.centerXAnchor.constraint(equalTo: self.alertView.centerXAnchor, constant: 0).isActive = true
            save.widthAnchor.constraint(equalToConstant: 180).isActive = true
            save.heightAnchor.constraint(equalToConstant: 45).isActive = true
            save.bottomAnchor.constraint(equalTo: self.alertView.bottomAnchor, constant: -10).isActive = true
            
            
            
            let product = self.alertViewInstance.ProductName
            self.alertView.addSubview(product)
            
            product.centerXAnchor.constraint(equalTo: self.alertView.centerXAnchor, constant: 0).isActive = true
            product.widthAnchor.constraint(equalToConstant: 180).isActive = true
            product.heightAnchor.constraint(equalToConstant: 45).isActive = true
            product.bottomAnchor.constraint(equalTo: save.topAnchor, constant: -10).isActive = true
            
            save.addTarget(self, action: #selector(addData), for: .touchUpInside)
            
            
            
            
            
            
            
            
            // let protein = self.alertViewInstance.
            //self.alertView.addSubview(protein)
            
            // product.centerXAnchor.constraint(equalTo: self.alertView.centerXAnchor, constant: 0).isActive = true
            //product.widthAnchor.constraint(equalToConstant: 180).isActive = true
            //product.heightAnchor.constraint(equalToConstant: 45).isActive = true
            //product.bottomAnchor.constraint(equalTo: product.topAnchor, constant: -10).isActive = true
            
            
        
            
        }
        
        
        @ objc func addData() {
            
            if let productText = alertViewInstance.ProductName.text {
                
                TableData.shared.productArray.append(productText)
                
            }
            print(TableData.shared.productArray)
           print(TableData.shared.productArray.count)
            var array = ((TableData.shared.productArray.count)-1)
            
   
            parentView.removeFromSuperview()
            
        }
        
        
        
}
