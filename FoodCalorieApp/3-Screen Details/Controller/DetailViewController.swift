//
//  DetailViewController.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-08.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    

     var detailInstance = ViewForDetailViewController()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addConstraints()
        detailInstance.productField.delegate = self
        detailInstance.calorieField.delegate = self
        detailInstance.saveBtn.addTarget(self, action: #selector(Save), for: .touchUpInside)
        detailInstance.backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    
    func addConstraints() {
        
        let productField = detailInstance.productField
        let saveBtn = detailInstance.saveBtn
        let calorieField = detailInstance.calorieField
        let proteinField = detailInstance.proteinField
        let carbField = detailInstance.carbField
        let fatField = detailInstance.fatField
        let backBtn  = detailInstance.backBtn
        

        
        view.addSubview(productField)
        view.addSubview(saveBtn)
        view.addSubview(calorieField)
        view.addSubview(proteinField)
        view.addSubview(carbField)
        view.addSubview(fatField)
        view.addSubview(backBtn)
        
        
        
        productField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        productField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        productField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        productField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        saveBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        saveBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80).isActive = true
        saveBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        saveBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        calorieField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        calorieField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
        calorieField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        calorieField.widthAnchor.constraint(equalToConstant: 150).isActive = true
     
        
        
        proteinField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        proteinField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        proteinField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        proteinField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
    
        carbField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        carbField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        carbField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        carbField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        
        fatField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        fatField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        fatField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fatField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        backBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 25).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 25).isActive = true
        

   
    }
    
    @objc func Save() {
        
        var data = TableData.shared
        
        
        
        
        if detailInstance.productField.text != "" {
            data.productArray[data.count].append(detailInstance.productField.text!)
        } else {
            data.productArray[data.count].append("")
        }
        if detailInstance.calorieField.text != "" {
             data.calorieArray[data.count].append(Int(detailInstance.calorieField.text!)!)
        } else {
             data.calorieArray[data.count].append(0)
        }
        if detailInstance.proteinField.text != "" {
            data.proteinArray[data.count].append(Int(detailInstance.proteinField.text!)!)
        } else {
              data.proteinArray[data.count].append(0)
        }
        if detailInstance.carbField.text != "" {
            data.carbohydrateArray[data.count].append(Int(detailInstance.carbField.text!)!)
        } else {
             data.carbohydrateArray[data.count].append(0)
            
        }
        if detailInstance.fatField.text != "" {
            data.fatArray[data.count].append(Int(detailInstance.fatField.text!)!)
        } else {
            data.fatArray[data.count].append(0)
        }
        
        
        dismiss(animated: true , completion: nil)
        
      
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    @objc func back() {
        dismiss(animated: true , completion: nil)
    }
    
}
