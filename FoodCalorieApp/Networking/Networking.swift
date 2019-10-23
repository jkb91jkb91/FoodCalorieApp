//
//  Networking.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-05.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation

class NetworkingService {
    
    private init() {}
    
    static let shared = NetworkingService()
    func get(input: URL, completion: @escaping (Any) -> Void) {
    

        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)

        
        let task = session.dataTask(with: input) { (data, response, error) in
            
            if let response = response {
           
            }
            if let data = data {
   
                do {
      
                    let json = try JSONDecoder().decode(Object.self, from: data)
    
                    completion(json)

                    }
 
            catch let error as NSError {
                    print(error.localizedDescription)
 
                }
                
            }
            
        }
        task.resume()
    
    }
  
}
