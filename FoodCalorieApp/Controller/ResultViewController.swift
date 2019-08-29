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
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if post.isEmpty == true {
            return 0
        } else {
            
            return post.count
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        
        let meal = Meals(context: context)
        meal.productField = post[indexPath.row].label
        meal.calorieField = Int16(post[indexPath.row].nutrients.ENERC_KCAL!)
        meal.proteinField = Int16(post[indexPath.row].nutrients.PROCNT!)
        meal.carbField = Int16(post[indexPath.row].nutrients.CHOCDF!)
        meal.fatField = Int16(post[indexPath.row].nutrients.FAT!)
        
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
        
        
        
        if post[indexPath.row].label != nil {
            
            cell.Namelabel.text = post[indexPath.row].label
        } else {
            
            cell.Namelabel.text = ""
        }
        
        if post[indexPath.row].nutrients.ENERC_KCAL != nil {
            
            cell.calorieTextlabel.text = String(Int(post[indexPath.row].nutrients.ENERC_KCAL!))
        } else {
            
            cell.Namelabel.text = ""
        }
        
        if post[indexPath.row].nutrients.PROCNT != nil {
            
            cell.proteinTextlabel.text = String(Int(post[indexPath.row].nutrients.PROCNT!))
        } else {
            
            cell.proteinTextlabel.text = ""
        }
        
        
        if post[indexPath.row].nutrients.CHOCDF != nil {
            
            cell.carbTextlabel.text = String(Int(post[indexPath.row].nutrients.CHOCDF!))
        } else {
            
            cell.carbTextlabel.text = ""
        }
        
        if post[indexPath.row].nutrients.FAT != nil {
            
            cell.fatTextlabel.text = String(Int(post[indexPath.row].nutrients.FAT!))
        } else {
            
            cell.fatTextlabel.text = ""
        }
        
        
        return cell
    }
    
  
    

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "cell")
 
        addConstraint()
        collectionView.delegate = self
        collectionView.dataSource = self
        searchbar.delegate = self
        arrowButton1.addTarget(self, action: #selector(back), for: .touchUpInside)
 
        
    
    }
    
    

    
    
    

   
    
    
    
    let collectionView: UICollectionView = {
        
        
        let width = Int(UIScreen.main.bounds.width)
        let height = Int(UIScreen.main.bounds.height)
        let cview = UICollectionView(frame: CGRect(x: 0, y: 150, width: width, height: height), collectionViewLayout: UICollectionViewFlowLayout())
      cview.backgroundColor = UIColor.white

        
        
        
        return cview
        
    }()
    
    
    let arrowButton1: UIButton = {
        
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.setImage(UIImage(named: "c"), for: .normal)
        
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
    
    func addConstraint() {
       
     
        
         view.addSubview(topView)
        
         view.addSubview(searchbar)
        view.addSubview(collectionView)
       topView.addSubview(arrowButton1)
        
       
        
       
        
        
        topView.topAnchor.constraint(equalTo: view.topAnchor, constant:  0).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        topView.bottomAnchor.constraint(equalTo: searchbar.topAnchor, constant: 0).isActive = true
        
        searchbar.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: 0).isActive = true
        searchbar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        searchbar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        
       
        arrowButton1.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20).isActive = true

        arrowButton1.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -5).isActive = true
        arrowButton1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        arrowButton1.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width, height: 100)
        
        
    }
    

    let searchbar: UISearchBar = {
        
        let view = UISearchBar()
        view.translatesAutoresizingMaskIntoConstraints = false
      
        
        return view
        
        
    }()
    
    
    @objc func back() {
        
        
        dismiss(animated: true , completion: nil)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        
       
        
        
        
        PostNetworking.getPost(input: searchbar.text!) { (response) in
           print(response)
            print(response.posts.count)
            self.post = response.posts
           
            
            DispatchQueue.main.async {
               self.collectionView.reloadData()
            }
           
        }
        
   
       
    }
    
    
    
}
