//
//  Networking.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-05.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//MARK:-Module

import Foundation

//MARK:-class
class NetworkingService {
    
    private init() {}
    
//Mark:-Singleton
    static let shared = NetworkingService()
//Mark:-Function
    func get(input: URL, completion: @escaping (Any) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)

        
        let task = session.dataTask(with: input) { (data, response, error) in
            
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print("valid response, status 200")
           }
            if let data = data {
   
                do {
                    let json = try JSONDecoder().decode(Object.self, from: data)
                    completion(json)
                } catch let error as NSError {
                    print(error.localizedDescription)
                    
                }
            }
        }
        task.resume()
    }
    
}
