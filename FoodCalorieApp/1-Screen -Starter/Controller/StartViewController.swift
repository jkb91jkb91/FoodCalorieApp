//
//  ViewController.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-05.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    let viewInstance = View()
    var counter = 1

    override func viewDidLoad() {
     super.viewDidLoad()
        addConstraints()
        view.backgroundColor = UIColor.white
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: false)
        
     
    }
    func getToVc() {
        present(TableController(), animated: true, completion:  nil)
    }
    
    @objc func update() {
        
        print(counter)
        while counter < 5 {
            counter += 1 }
        getToVc()
      }
    
    
    func addConstraints() {
        
        let buttonFromVIew = viewInstance.button
        view.addSubview(buttonFromVIew)
        
        buttonFromVIew.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        buttonFromVIew.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        buttonFromVIew.widthAnchor.constraint(equalToConstant: 300).isActive = true
        buttonFromVIew.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

