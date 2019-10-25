//
//  ResultView.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-31.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//MARK:-Modules

import Foundation
import UIKit

//MARK:-Class

class ResultView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
//MARK:-Function-addConstraint
    
    func addConstraint() {
        addSubview(topView)
        addSubview(searchbar)
        addSubview(collectionView)
        topView.addSubview(arrowButton)
        
        topView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(searchbar.snp.top)
        }
        
        searchbar.snp.makeConstraints { (make) in
            make.bottom.equalTo(collectionView.snp.top)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        arrowButton.snp.makeConstraints { (make) in
            make.leading.equalTo(topView.snp.leading).offset(20)
            make.bottom.equalTo(topView.snp.bottom).offset(-5)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
    }
}
