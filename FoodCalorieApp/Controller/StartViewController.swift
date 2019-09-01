//
//  ViewController.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-05.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit


class StartViewController: UIViewController {
    
 
    var counter = 1

    
   
    

    override func loadView() {
        self.view = StartView()
    }
    
    
    override func viewDidLoad() {
     super.viewDidLoad()
        
        
       
        
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
    
    
        
    }


