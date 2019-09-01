//
//  DetailViewController.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-08.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
   
    
    unowned var detailView : ViewForDetailViewController { return self.view as! ViewForDetailViewController}
    unowned var productField : UITextField {return detailView.productField}
    unowned var calorieField: UITextField {return detailView.calorieField}
    unowned var saveBtn : UIButton {return detailView.saveBtn}
    unowned var backBtn : UIButton {return detailView.backBtn}
    unowned var proteinField: UITextField { return detailView.proteinField}
    unowned var carbField: UITextField { return detailView.carbField}
    unowned var fatField: UITextField { return detailView.fatField}
    
    
    var current: Day!

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func loadView() {
        self.view = ViewForDetailViewController()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
       
      
       productField.delegate = self
       calorieField.delegate = self
        saveBtn.addTarget(self, action: #selector(Save), for: .touchUpInside)
      backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        

    
    }

    
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
        dismiss(animated: true , completion: nil)
    
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    @objc func back() {
        dismiss(animated: true , completion: nil)
    }
    
}
