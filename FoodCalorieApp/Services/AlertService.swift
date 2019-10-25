//
//  AlertService.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-10-23.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

struct AlertService {
    
    static func  showAlert(vc: UIViewController, currentDay: Day) {
        let alert = UIAlertController(title: "Choose Method", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Custom Meal", style: .default) { (_) in
                let detailVC = DetailViewController()
                detailVC.current = currentDay
                vc.present(detailVC, animated: true, completion: nil)}
        let action2 = UIAlertAction(title: "Use DataBase", style: .default) { (_) in
            let resultVC = ResultViewController()
            resultVC.current = currentDay
            vc.present(resultVC, animated: true, completion: nil)
            }
        alert.addAction(action)
        alert.addAction(action2)
        vc.present(alert, animated:true, completion: nil)
    }
    
}
