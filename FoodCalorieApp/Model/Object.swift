//
//  Object.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-13.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation

struct Nutrient: Decodable {
    
    var energy : Float?
    var protein : Float?
    var fat : Float?
    var carbs: Float?
  
 
    
    enum CodingKeys: String, CodingKey {
        case energy = "ENERC_KCAL"
        case protein = "PROCNT"
        case fat = "FAT"
        case carbs = "CHOCDF"
   
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
