//
//  MacroDataType.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-29.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation

enum MacroDataType {
    case calorieField
    case proteinField
    case carbField
    case fatField    
}

enum MacroNames: String {
    case protein = "Protein:"
    case carbs = "Carbohydrate:"
    case fat = "Fat:"
    case kal = "kCal:"
    
}
enum Products: String {
    case product = "Product"
    case calories = "Calories"
    case protein = "Protein"
    case carbs = "Carbohydrates"
    case fats = "Fats"
}
