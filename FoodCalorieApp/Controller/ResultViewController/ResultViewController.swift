//
//  ResultViewController.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-05.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

//MARK:-Modules

import UIKit

//MARK:-Class

class ResultViewController: UINavigationController {
    
//MARK:-IBoutlets
    
    unowned var resultView: ResultView {return self.view as! ResultView}
    unowned var collectionView: UICollectionView { return resultView.collectionView}
    unowned var searchbar : UISearchBar { return resultView.searchbar}
    unowned var arrowButton: UIButton { return resultView.arrowButton}

//MARK:-Properties
    
    let resultcellIdentifier = "resultCell"
    var post = [Food]()
    var current: Day!
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
//MARK:-Lifecycle
    
    override func loadView() {
        self.view = ResultView()
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

//MARK:-UISetup
    
    func setupUI(){
        collectionView.register(ResultCell.self, forCellWithReuseIdentifier: resultcellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        searchbar.delegate = self
        arrowButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
//MARK:-TargetActions
    
    @objc func back() {
           dismiss(animated: true , completion: nil)
       }
}

//MARK:-UISearchBarDelegate extension

extension ResultViewController: UISearchBarDelegate {
    
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
