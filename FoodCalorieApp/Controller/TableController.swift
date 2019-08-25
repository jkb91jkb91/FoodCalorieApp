//
//  Table.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-06.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit
import ObjectiveC

var viewInstance = ViewRepresantation()
var table = viewInstance.table


class TableController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
  
    
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addConstraints()
        table.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self
        table.delegate = self
        
        viewInstance.button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        viewInstance.arrowButton1.addTarget(self, action: #selector(rightArrowAction), for: .touchUpInside)
        viewInstance.arrowButton2.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
    
      
        
        TableData.shared.productArray.append([String]())
        TableData.shared.proteinArray.append([Int]())
       TableData.shared.carbohydrateArray.append([Int]())
       TableData.shared.fatArray.append([Int]())
       TableData.shared.calorieArray.append([Int]())
        
  
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let data = TableData.shared
        print(     data.productArray)
        print(     data.calorieArray)
        print(     data.proteinArray)
        print(     data.carbohydrateArray)
        print(     data.fatArray)
        
        if data.productArray.count >= 0 {
            table.reloadData()
            
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
guard let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
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
        
        
        let tableView = table
        let bottomView = viewInstance.bottomView
        let button = viewInstance.button
        let topView = viewInstance.topView
        let label = viewInstance.label
        
        
        
        
        let proteinlabel = viewInstance.proteinlabel
        let carblabel = viewInstance.carblabel
        let fatlabel = viewInstance.fatlabel
        
        let stack = viewInstance.createStackView(view1: proteinlabel, view2: carblabel, view3: fatlabel)
        
        
        //let dateLabel = viewInstance.dateLabel
        let arrowButton1 = viewInstance.arrowButton1
        let arrowButton2 = viewInstance.arrowButton2
        
        let proteinLabelText = viewInstance.proteinLabelText
        let carbLabelText = viewInstance.carbLabelText
        let fatLabelText = viewInstance.fatLabelText
        
        let stack2 = viewInstance.createStackView(view1: proteinLabelText, view2: carbLabelText, view3: fatLabelText)
        
        view.addSubview(tableView)
        view.addSubview(bottomView)
        view.addSubview(button)
        view.addSubview(topView)
        view.addSubview(label)
       
        
        //topView.addSubview(proteinlabel)
        //topView.addSubview(carblabel)
        //topView.addSubview(fatlabel)
        topView.addSubview(stack)
        
        //topView.addSubview(proteinLabelText)
        //topView.addSubview(carbLabelText)
        //topView.addSubview(fatLabelText)
        topView.addSubview(stack2)
        
        //bottomView.addSubview(dateLabel)
        bottomView.addSubview(arrowButton1)
        bottomView.addSubview(arrowButton2)
        
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
        
        
        //proteinlabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -30).isActive = true
        //proteinlabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20).isActive = true
       // proteinlabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
       // proteinlabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //carblabel.bottomAnchor.constraint(equalTo:topView.bottomAnchor, constant: -30).isActive = true
        //carblabel.leadingAnchor.constraint(equalTo: proteinlabel.trailingAnchor, constant: 5).isActive = true
        //carblabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //carblabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        //fatlabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -30).isActive = true
        //fatlabel.leadingAnchor.constraint(equalTo: carblabel.trailingAnchor, constant: 5).isActive = true
       // fatlabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
       // fatlabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        stack.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -32).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stack.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0).isActive = true
        stack.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        
        
        
        stack2.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -2).isActive = true
        stack2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stack2.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0).isActive = true
        stack2.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        
        
    
       // dateLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: 0).isActive = true
       // dateLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: 0).isActive = true
        //dateLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //dateLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        arrowButton1.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: 100).isActive = true
        arrowButton1.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: 0).isActive = true
        arrowButton1.widthAnchor.constraint(equalToConstant: 50).isActive = true
        arrowButton1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        arrowButton2.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: -100).isActive = true
        arrowButton2.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: 0).isActive = true
        arrowButton2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        arrowButton2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
   /* func date() -> String {
        
        let dateformat = DateFormatter()
        dateformat.dateFormat = "yyyy-MM-dd"
        let date = Date()
        let dateString = dateformat.string(from: date)
        return dateString
        
        let modifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: date)
      
        
    }
    */
    
        
        
        
        
    
        
        
    
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
            table.reloadData()
            
        }
        if data.count > 0 {
            table.reloadData()
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
            table.reloadData()
            print(data.count)
            updateLabels()

            
        }
    }
    
    func updateLabels() {
      let data = TableData.shared
        
        viewInstance.label.text = "\(String(self.sumMacro(cal: data.calorieArray))) kcal"
        viewInstance.proteinLabelText.text = String(self.sumMacro(cal: TableData.shared.proteinArray))
        viewInstance.carbLabelText.text = String(self.sumMacro(cal: data.carbohydrateArray))
        viewInstance.fatLabelText.text = String(self.sumMacro(cal: data.fatArray))
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

 


