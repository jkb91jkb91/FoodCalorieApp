//
//  ResultViewController.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-05.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

class ResultViewController: UINavigationController, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    
    var post = [Food]()
    var current: Day!
    var resultViewInstance = ResultView() 
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultViewInstance.collectionView.register(ResultCell.self, forCellWithReuseIdentifier: "cell")
        addConstraint()
        resultViewInstance.collectionView.delegate = self
        resultViewInstance.collectionView.dataSource = self
        resultViewInstance.searchbar.delegate = self
        resultViewInstance.arrowButton.addTarget(self, action: #selector(back), for: .touchUpInside)
 }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if post.isEmpty == true {
            return 0
        } else {
            
            return post.count
        }
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ResultCell
        
        
        
     let postcell = post[indexPath.row]
        
        cell.updateResultCell(food: postcell)
        
        
        /*
        
        if post[indexPath.row].label != nil {
            
            cell.Namelabel.text = post[indexPath.row].label.uppercased()
        } else {
            
            cell.Namelabel.text = ""
        }
        
        if post[indexPath.row].nutrients.ENERC_KCAL != nil {
            
            cell.calorieTextlabel.text = String(Int(post[indexPath.row].nutrients.ENERC_KCAL!)).uppercased()
        } else {
            
            cell.Namelabel.text = ""
        }
        
        if post[indexPath.row].nutrients.PROCNT != nil {
            
            cell.proteinTextlabel.text = String(Int(post[indexPath.row].nutrients.PROCNT!)).uppercased()
        } else {
            
            cell.proteinTextlabel.text = ""
        }
        
        
        if post[indexPath.row].nutrients.CHOCDF != nil {
            
            cell.carbTextlabel.text = String(Int(post[indexPath.row].nutrients.CHOCDF!)).uppercased()
        } else {
            
            cell.carbTextlabel.text = ""
        }
        
        if post[indexPath.row].nutrients.FAT != nil {
            
            cell.fatTextlabel.text = String(Int(post[indexPath.row].nutrients.FAT!)).uppercased()
        } else {
            
            cell.fatTextlabel.text = ""
        }
 */
        return cell

    }
   
    
    func addConstraint() {
        
        
        
        let topView = resultViewInstance.topView
        let searchbar = resultViewInstance.searchbar
        let collectionView = resultViewInstance.collectionView
        let arrowButton = resultViewInstance.arrowButton
        
        view.addSubview(topView)
        view.addSubview(searchbar)
        view.addSubview(collectionView)
        topView.addSubview(arrowButton)
        topView.topAnchor.constraint(equalTo: view.topAnchor, constant:  0).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        topView.bottomAnchor.constraint(equalTo: searchbar.topAnchor, constant: 0).isActive = true
        searchbar.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: 0).isActive = true
        searchbar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        searchbar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        arrowButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20).isActive = true
        arrowButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -5).isActive = true
        arrowButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        arrowButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width, height: 100)
    }
    
    
    @objc func back() {
        dismiss(animated: true , completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        PostNetworking.getPost(input: resultViewInstance.searchbar.text!) { (response) in
           print(response)
            print(response.posts.count)
            self.post = response.posts
           DispatchQueue.main.async {
            self.resultViewInstance.collectionView.reloadData()
            }
        }
    }
}
