//
//  AlertService.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-08.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

class AlertService {
    
    
    func alert() -> AlertViewController {
        
        let storyboard = UIStoryboard(name: "AlertVC", bundle: .main)
        let alertVC = storyboard.instantiateViewController(withIdentifier: "AlertVC") as! AlertViewController
        
        
        return alertVC
        
        
        
        
        
        
    }
    
    
    
    
    
}
