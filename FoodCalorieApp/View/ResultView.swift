//
//  ResultView.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-31.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation
import UIKit

class ResultView : UIView {
    
    
    
    
    
    
    let collectionView: UICollectionView = {
        let width = Int(UIScreen.main.bounds.width)
        let height = Int(UIScreen.main.bounds.height)
        let cview = UICollectionView(frame: CGRect(x: 0, y: 150, width: width, height: height), collectionViewLayout: UICollectionViewFlowLayout())
        cview.backgroundColor = UIColor.white
        return cview
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
    
    
    
    let searchbar: UISearchBar = {
        
        let view = UISearchBar()
        view.placeholder = "Type something in english"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let arrowButton: UIButton = {
        
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.setImage(UIImage(named: "c"), for: .normal)
        
        return view
    }()
    
    
}
