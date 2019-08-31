//
//  ViewController.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-05.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {
    
    let viewInstance = StartView()
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
        
        buttonFromVIew.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
    }
}

