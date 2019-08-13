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
    
        print("111111111111111111111111111111")
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        print("2222222222222222222222222222222")
        
        let task = session.dataTask(with: input) { (data, response, error) in
            
            if let response = response {
           
                print("RESPONESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS")
            }
            
            
            
            if let data = data {
              
                print(data)
                
                
                do {
                    
             
                    let json = try JSONDecoder().decode(Object.self, from: data)
                  
                    
                  
                    
                    completion(json)
                    print("This is 66666666666666666")
                    }
                    
                
                
                
            catch let error as NSError {
                    print(error.localizedDescription)
                print("ERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRORRRR")
                }
          
            }
                
        }
        task.resume()
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
}
