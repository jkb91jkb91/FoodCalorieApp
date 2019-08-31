//
//  Object.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-13.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation


    

struct Nutrient: Decodable {
    
    var ENERC_KCAL : Float?
    var PROCNT : Float?
    var FAT : Float?
    var CHOCDF: Float?
  
    
    init(energ:Float, proc: Float, Fat: Float, Choc: Float, FIb: Float) {
        self.ENERC_KCAL = energ
        self.PROCNT = proc
        self.FAT = Fat
        self.CHOCDF = Choc
   
    }
    
    enum CodingKeys: String, CodingKey {
        case ENERC_KCAL = "ENERC_KCAL"
        case PROCNT = "PROCNT"
        case FAT = "FAT"
        case CHOCDF = "CHOCDF"
   
    }
  
}


struct Food: Decodable {
    
    var label: String?
    var nutrients: Nutrient
    init(label:String, nutrients: Nutrient) {
        self.label = label
        self.nutrients = nutrients
    }
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
        case nutrients = "nutrients"
    }
}


struct hints: Decodable {
    
    var food: Food
    
    init(food: Food) {
        self.food = food
    }
    
    enum CodingKeys: String, CodingKey {
        case food = "food"
    }
    
}

struct Object: Decodable {
    var text: String
    
    var hints: [hints]
    
    
    init(text: String, hints: [hints]) {
        self.hints = hints
        self.text = text
    }
    
    enum CodingKeys: String, CodingKey {
        case hints = "hints"
        case text = "text"
        
        }
}
