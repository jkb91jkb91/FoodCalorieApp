//
//  Logic.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-11.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation


class PostNetworking {
    
    
    private init() {}
    
    
    
   static func getPost(input: String, completion: @escaping (GetResponse) -> Void) {
        
        
        guard let url = URL(string: "https://api.edamam.com/api/food-database/parser?nutrition-type=logging&ingr=\(input)&app_id=c3f9917c&app_key=28f470c4c0d9c3dc18b95631a5ba82b0")
            else { return}
    print(url)
        NetworkingService.shared.get(input: url) { (json) in
            
            
            do {
                print("In response")
                let response = try GetResponse(json: json)
                completion(response)
                print("we are here")
                print(response.posts.count)
                
            } catch {}
            
            
            
        }
        
        
    }
    
    
    
    
    
}
