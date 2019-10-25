//
//  RVC+CollectionDelegate&DataSource.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-10-23.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//MARK:-Module

import UIKit

//MARK: -UICollectionVieDataSource extension

extension ResultViewController: UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resultcellIdentifier, for: indexPath) as! ResultCell
        let postcell = post[indexPath.row]
        cell.updateResultCell(food: postcell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           if post.isEmpty == true {
               return 0
           } else {
               return post.count
           }
       }
}

//MARK: -UICollectionViewDelegate extension

extension ResultViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let meal = Meals(context: context)
        if let product = post[indexPath.row].label {
            meal.productField = product
        } else {
            meal.productField = ""
        }
        if let calorie = post[indexPath.row].nutrients.ENERC_KCAL {
            meal.calorieField = Int16(calorie)
            } else {
            meal.calorieField = Int16(0)
            }
            
        if let protein = post[indexPath.row].nutrients.PROCNT {
            meal.proteinField = Int16(protein)
        } else {
            meal.proteinField = Int16(0)
        }
    
        if let carb = post[indexPath.row].nutrients.CHOCDF {
            meal.carbField = Int16(carb)
        } else {
            meal.carbField = Int16(0)
        }
        
        if let fat = post[indexPath.row].nutrients.FAT {
            meal.fatField = Int16(fat)
        } else {
            meal.fatField = Int16(0)
        }
        
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
    
}
