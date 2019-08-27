//
//  Table.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-06.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit
import ObjectiveC



class TableController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
  
    
    var tcv : TcV!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addConstraints()
        tcv.table.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tcv.table.dataSource = self
        tcv.table.delegate = self
        
        tcv.button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        tcv.arrowButton1.addTarget(self, action: #selector(rightArrowAction), for: .touchUpInside)
        tcv.arrowButton2.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
    
      
        
        TableData.shared.productArray.append([String]())
        TableData.shared.proteinArray.append([Int]())
       TableData.shared.carbohydrateArray.append([Int]())
       TableData.shared.fatArray.append([Int]())
       TableData.shared.calorieArray.append([Int]())
        
  
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let data = TableData.shared
        
        if data.productArray.count >= 0 {
            tcv.table.reloadData()
            
           updateLabels()
        
           
        
        }
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(100)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let gdata = TableData.shared
        return gdata.productArray[gdata.count].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = TableData.shared
guard let cell = tcv.table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            return UITableViewCell() }
        if data.productArray[data.count].isEmpty == false   {
         cell.Namelabel.text = TableData.shared.productArray[data.count][(indexPath.row)] }
        if data.calorieArray[data.count].isEmpty == false  {
            cell.calorielabel.text = String(data.calorieArray[data.count][indexPath.row]) }
        if data.proteinArray[data.count].isEmpty == false {
            cell.proteinLabelText.text = String(data.proteinArray[data.count][indexPath.row]) }
        if data.carbohydrateArray[data.count].isEmpty == false {
            cell.carbLabelText.text = String(data.carbohydrateArray[data.count][indexPath.row]) }
        if data.fatArray[data.count].count > 0 {
            cell.fatLabelText.text = String(data.fatArray[data.count][indexPath.row]) }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let count = TableData.shared.count
            
            TableData.shared.productArray[count].remove(at: indexPath.row)
            TableData.shared.proteinArray[count].remove(at: indexPath.row)
            TableData.shared.carbohydrateArray[count].remove(at: indexPath.row)
            TableData.shared.fatArray[count].remove(at: indexPath.row)
            TableData.shared.calorieArray[count].remove(at: indexPath.row)
            tableView.reloadData()
            updateLabels()
            
        }
    }

    func addConstraints() {
        
        let tableView = tcv.table
        let bottomView = tcv.bottomView
        let button = tcv.button
        let topView = tcv.topView
        let label = tcv.label
        let proteinlabel = tcv.proteinlabel
        let carblabel = tcv.carblabel
        let fatlabel = tcv.fatlabel
        let stack = tcv.createStackView(view1: proteinlabel, view2: carblabel, view3: fatlabel)
        let arrowButton1 = tcv.arrowButton1
        let arrowButton2 = tcv.arrowButton2
        let dateLbl = tcv.dateLabel
        let stack3 = tcv.createStackView(view1: arrowButton2, view2: dateLbl, view3: arrowButton1)
        let proteinLabelText = tcv.proteinLabelText
        let carbLabelText = tcv.carbLabelText
        let fatLabelText = tcv.fatLabelText
        let stack2 = tcv.createStackView(view1: proteinLabelText, view2: carbLabelText, view3: fatLabelText)
        view.addSubview(tableView)
        view.addSubview(bottomView)
        view.addSubview(button)
        view.addSubview(topView)
        view.addSubview(label)
        topView.addSubview(stack)
        topView.addSubview(stack2)
        bottomView.addSubview(stack3)
        
        tableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:   0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: 0).isActive = true
        
        bottomView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:   0).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:   0).isActive = true
        
        topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:   0).isActive = true
        
        button.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: -25).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        label.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
        label.widthAnchor.constraint(equalToConstant: 60).isActive = true
    
        stack.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -32).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stack.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0).isActive = true
        stack.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        
        stack2.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -2).isActive = true
        stack2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stack2.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0).isActive = true
        stack2.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        
        stack3.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: 0).isActive = true
        stack3.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: 0).isActive = true
        stack3.widthAnchor.constraint(equalToConstant: 300).isActive = true
        stack3.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    

    func setDate() {
        
  
        
        
        
        
    }
        
        
    
    @objc func performAction() {
        present(ResultViewController(), animated: false, completion:nil)
        
    }
    
    @objc func showAlert() {
        let alert = UIAlertController(title: "Choose Method", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Custom Meal", style: .default) { (_) in
            self.present(DetailViewController(), animated: true, completion: nil)}
        let action2 = UIAlertAction(title: "Use DataBase", style: .default) { (_) in
            self.present(ResultViewController(), animated: true, completion: nil)
        }
        alert.addAction(action)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
   
    
    @objc func rightArrowAction() {
        
        
        let data = TableData.shared
        data.count += 1
        print(data.count)
        if data.count > (data.productArray.count) - 1 {
            data.productArray.append([String]())
            data.proteinArray.append([Int]())
            data.carbohydrateArray.append([Int]())
            data.fatArray.append([Int]())
            data.calorieArray.append([Int]())
            tcv.table.reloadData()
            
        }
        if data.count > 0 {
            tcv.table.reloadData()
            updateLabels()
        }
        print(data.count)
    }
    
    @objc func leftAction() {
        
        
        let data = TableData.shared
        if data.count == 0 {
            return
        
        } else {
            
            data.count -= 1
            tcv.table.reloadData()
            print(data.count)
            updateLabels()

            
        }
    }
    
    func updateLabels() {
      let data = TableData.shared
        
        tcv.label.text = "\(String(self.sumMacro(cal: data.calorieArray))) kcal"
        tcv.proteinLabelText.text = String(self.sumMacro(cal: TableData.shared.proteinArray))
        tcv.carbLabelText.text = String(self.sumMacro(cal: data.carbohydrateArray))
        tcv.fatLabelText.text = String(self.sumMacro(cal: data.fatArray))
    }
 
    
    
    
    func sumMacro(cal: [[Int]]) ->Int {
           let data = TableData.shared
        
        var calSum = 0
        for item in cal[data.count] {
            calSum += item
        }
        return calSum
        
        
    }
    
}

 



