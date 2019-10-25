//
//  GetResponse.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-11.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

//MARK:-Module

import Foundation
 
//Mark:-Struct

struct GetResponse {
    
    let posts: [Food]
    
    init(json:Any ){
        print("weeeeeeeee")
          var food = [Food]()
        let data = json as! Object
        
        for i in data.hints {
            print(i)
            food.append(i.food)
        }
        self.posts = food
    }
}
