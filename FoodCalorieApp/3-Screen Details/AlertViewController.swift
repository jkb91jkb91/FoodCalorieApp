//
//  AlertViewController.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-08.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit


protocol TableProtocol: class{
    
    func launchPresent()
    
    
    
    
}

class AlertViewController: UIViewController {
    
    
    weak var delegate: TableProtocol? = nil
    
    

    @IBAction func baseBtn(_ sender: Any) {
    }
    
    
    @IBAction func customBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        delegate?.launchPresent()
        TableData.shared.productArray.append("1")
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
