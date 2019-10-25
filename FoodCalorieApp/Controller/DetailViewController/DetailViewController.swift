//
//  DetailViewController.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-08.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//MARK:-Modules

import UIKit

//MARK:-protocol

protocol InsertProtocol: class {
    func insertCell()
}

//MARK:-Class

class DetailViewController: UIViewController {
   
//MARK:-Outlets
    
    unowned var detailView : ViewForDetailViewController { return self.view as! ViewForDetailViewController}
    unowned var productField : UITextField {return detailView.productField}
    unowned var calorieField: UITextField {return detailView.calorieField}
    unowned var saveBtn : UIButton {return detailView.saveBtn}
    unowned var backBtn : UIButton {return detailView.backBtn}
    unowned var proteinField: UITextField { return detailView.proteinField}
    unowned var carbField: UITextField { return detailView.carbField}
    unowned var fatField: UITextField { return detailView.fatField}

//Mark:-Properties
    
    var current: Day!
    weak var delegate: InsertProtocol?
    
//Mark:-Lifecycle
    
    override func loadView() {
        self.view = ViewForDetailViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
//MARK:-SetupUI
    
    func setupUI(){
        productField.delegate = self
        calorieField.delegate = self
        saveBtn.addTarget(self, action: #selector(Save), for: .touchUpInside)
        backBtn.addTarget(self, action: #selector(showPreviousScreen), for: .touchUpInside)
    }
    
//MARK:-TargetActions
    
    @objc func Save() {
        let meal = Meals(context: context)
        meal.productField = productField.text
        meal.calorieField = Int16(calorieField.text!) ?? 0
        meal.proteinField = Int16(proteinField.text!) ?? 0
        meal.carbField = Int16(carbField.text!) ?? 0
        meal.fatField = Int16(fatField.text!) ?? 0
    
        if let meals = current.meals?.mutableCopy() as? NSMutableOrderedSet {
            meals.add(meal)
            current.meals = meals
        }
        do {
            try context.save()
        } catch let error as NSError {
            print("\(error)")
        }
        delegate?.insertCell()
        dismiss(animated: true , completion: nil)
    }
    
    @objc func showPreviousScreen() {
        dismiss(animated: true , completion: nil)
    }
    
}

//MARK:-UITextFieldDelegate extension

extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
