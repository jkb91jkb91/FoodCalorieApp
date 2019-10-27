//
//  AlertService.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-10-23.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

struct AlertService {

    static func  showAlert(vc: UIViewController, action: @escaping() -> (), action2: @escaping() -> ()) {
        let alert = UIAlertController(title: "Choose Method", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Custom Meal", style: .default) { (alert) in
            action()}
        let action2 = UIAlertAction(title: "Use DataBase", style: .default) { (alert) in
            action2()}
        alert.addAction(action)
        alert.addAction(action2)
        vc.present(alert, animated:true, completion: nil)
    }
}
