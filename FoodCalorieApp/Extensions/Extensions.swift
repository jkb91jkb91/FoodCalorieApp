//
//  Extensions.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-05.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation
import UIKit


extension UILabel {
    
    
    func pulse() {
        
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 30
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 10
        pulse.initialVelocity = 0.5
        pulse.damping = 2.0
        layer.add(pulse, forKey: nil)
        
        
        
    }
    
    
    
    
}
