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
        meal.productField = post[indexPath.row].label ?? ""
        meal.calorieField = Int16(post[indexPath.row].nutrients.energy ?? 0)
        meal.proteinField = Int16(post[indexPath.row].nutrients.protein ?? 0)
        meal.carbField = Int16(post[indexPath.row].nutrients.carbs ?? 0)
        meal.fatField = Int16(post[indexPath.row].nutrients.fat ?? 0)
        
        if let meals = current?.meals?.mutableCopy() as? NSMutableOrderedSet {
            meals.add(meal)
            current?.meals = meals
        }
        do {
            try context.save()
        } catch let error as NSError {
            print("\(error)")
        }
        insertdelegate?.insertFromRestCell()
        dismiss(animated: true , completion: nil)
    }
}
