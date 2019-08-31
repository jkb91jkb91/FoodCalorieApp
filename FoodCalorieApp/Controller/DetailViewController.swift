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
    var current: Day!

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
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
        
        let meal = Meals(context: context)
        meal.productField = detailInstance.productField.text
        meal.calorieField = Int16(detailInstance.calorieField.text!) ?? 0
        meal.proteinField = Int16(detailInstance.proteinField.text!) ?? 0
        meal.carbField = Int16(detailInstance.carbField.text!) ?? 0
        meal.fatField = Int16(detailInstance.fatField.text!) ?? 0
    
        if let meals = current.meals?.mutableCopy() as? NSMutableOrderedSet {
            meals.add(meal)
            current.meals = meals
        }
        do {
            try context.save()
        } catch let error as NSError {
            print("\(error)")
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
