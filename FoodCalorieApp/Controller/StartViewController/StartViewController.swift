//
//  ViewController.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-05.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

//MARK:-Modules

import UIKit

//MARK:-Class

class StartViewController: UIViewController {
    
//MARK:-Properties
    var counter = 1
//MARK:-Lifecycle
    
    override func loadView() {
        self.view = StartView()
    }
    
    override func viewDidLoad() {
     super.viewDidLoad()
        
        startTimer()
    }
    
//Mark:-Functions
    
    func startTimer(){
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: false)
    }
    
    func presentTableController() {
        present(TableController(), animated: true, completion:  nil)
    }
//MARK:-TargetActions
    
    @objc func updateCounter() {
        print(counter)
        while counter < 5 {
            counter += 1 }
        presentTableController()
      }
}


