//
//  Table.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-06.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit
import ObjectiveC
import CoreData




class TableController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
  
    
    var tcv : TableViews!
    
    var currentState : Day?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addConstraints()
        tcv.table.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tcv.table.dataSource = self
        tcv.table.delegate = self
        
        tcv.button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        tcv.arrowButton1.addTarget(self, action: #selector(rightArrowAction), for: .touchUpInside)
        tcv.arrowButton2.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        
      
        
        let date = takeDate(type: .normal, dateString: nil)
        print(date)
        
        
        let fetch :NSFetchRequest<Day> = Day.fetchRequest()
        fetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Day.wartosc),date)
        
        do {
            
            let result = try context.fetch(fetch)
            if result.count > 0 {
                currentState = result.first
                tcv.dateLabel.text = currentState?.wartosc
 
            } else {
                
                let dzien = Day(context: context)
                dzien.wartosc = date
                currentState = dzien
                try context.save()
                
                tcv.dateLabel.text = date
                print("niewie")
            }
            
        }catch let error as NSError {
            print ( "\(error)")
        }
        
        updateLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tcv.table.reloadData()
        updateLabels()
        
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(100)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        guard let meals = currentState?.meals else {
            return 0
        }
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        guard let cell = tcv.table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            return UITableViewCell() }
        
        guard let meals = currentState?.meals?[indexPath.row] as? Meals
            else {
            return cell
            }
    
        cell.updateCell(meal: meals)
        
        
        
        
        
        
  /*
            cell.nameLabel.text = meals.productField
            cell.calorielabel.text = String(meals.calorieField)
            cell.proteinLabelText.text = String(meals.proteinField)
            cell.carbLabelText.text = String(meals.carbField)
            cell.fatLabelText.text = String(meals.fatField) 
        */
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            guard let toRemove = currentState?.meals![indexPath.row] as? Meals else {
                return
            }
            
            context.delete(toRemove)
            
            do {
                
                try context.save()
                tcv.table.deleteRows(at: [indexPath], with: .automatic)
            } catch let error as NSError {
                print("\(error)")
            }
        }
    }

    func addConstraints() {
        
        tcv = TableViews()
        
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
    
    func takeDate(type: DateType, dateString: String?) -> String {
    
    switch type {
    
    case .normal:
    
    let today = Date()
    let calendar = Calendar.current
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    let dateFromString = dateFormatter.string(from: today)
    return dateFromString
    
    
    case .forward:
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    let dateFromString = dateFormatter.date(from: dateString!)
    let calendar = Calendar.current
    let modifiedDate = calendar.date(byAdding: .day, value: 1, to: dateFromString!)
    dateFormatter.dateStyle = .short
    let stringFormat = dateFormatter.string(from: modifiedDate!)
    return stringFormat
    
    case .back:
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    let dateFromString = dateFormatter.date(from: dateString!)
 
    let calendar = Calendar.current
    let modifiedDate = calendar.date(byAdding: .day, value: -1, to: dateFromString!)

    dateFormatter.dateStyle = .short
    let stringFormat = dateFormatter.string(from: modifiedDate!)
    print(stringFormat)
    return stringFormat
    
    
        }
    }

    
    @objc func showAlert() {
        let alert = UIAlertController(title: "Choose Method", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Custom Meal", style: .default) { (_) in
            let detailVC = DetailViewController()
            detailVC.current = self.currentState
            self.present(detailVC, animated: true, completion: nil)}
        let action2 = UIAlertAction(title: "Use DataBase", style: .default) { (_) in
            let resultVC = ResultViewController()
            resultVC.current = self.currentState
            self.present(resultVC, animated: true, completion: nil)
        }
        alert.addAction(action)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
   
    
    @objc func rightArrowAction() {
        
        let current = currentState!.wartosc
  
        let plusOneDay = takeDate(type: .forward, dateString: current)
        print("plusOneDay = \(plusOneDay)")
        let fetch :NSFetchRequest<Day> = Day.fetchRequest()
        fetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Day.wartosc), plusOneDay)
        
        do {
            let result = try context.fetch(fetch)
            if result.count > 0 {
                currentState = result.first
                tcv.dateLabel.text = currentState?.wartosc
                print("miejstuTU")
            } else {
                
                let dzien = Day(context: context)
                dzien.wartosc = plusOneDay
                try context.save()
                self.currentState = dzien
                tcv.dateLabel.text = currentState?.wartosc
                print("DrugieMiejsc")
                
            }
            
        }catch let error as NSError {
            print ( "\(error)")
            }
        updateLabels()
        tcv.table.reloadData()

    }
    
    @objc func leftAction() {
        
        let current = currentState!.wartosc
        let backOneDay = takeDate(type: .back, dateString: current)
        print("plusOneDay = \(backOneDay)")
        let fetch :NSFetchRequest<Day> = Day.fetchRequest()
        fetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Day.wartosc), backOneDay)
        
        do {
            
            let result = try context.fetch(fetch)
            if result.count > 0 {
                currentState = result.first
                tcv.dateLabel.text = currentState?.wartosc
            } else {
                
                let dzien = Day(context: context)
                dzien.wartosc = backOneDay
                try context.save()
                currentState = dzien
                tcv.dateLabel.text = currentState?.wartosc
            }
            
        }catch let error as NSError {
            print ( "\(error)")
            
    }
        updateLabels()
        tcv.table.reloadData()
    }
    
    func updateLabels() {

        tcv.label.text = "\(String(self.sumMacro(macro: MacroDataType.calorieField))) kcal"
        print(self.sumMacro(macro: MacroDataType.calorieField))
        tcv.proteinLabelText.text = String(self.sumMacro(macro: MacroDataType.proteinField))
        tcv.carbLabelText.text = String(self.sumMacro(macro: MacroDataType.carbField))
        tcv.fatLabelText.text = String(self.sumMacro(macro: MacroDataType.fatField))
     
    }
 
    func sumMacro(macro: MacroDataType) ->Int16 {
        
        switch macro {
            
        case.calorieField:
            
            var calSum: Int16 = 0
            let count = currentState!.meals!.count
            for i in 0..<count {
                if let meals = currentState?.meals![i] as? Meals {
                    calSum += meals.calorieField
                }
             }
            return calSum
            
        case.proteinField:
            var calSum: Int16 = 0
            let count = currentState!.meals!.count
            for i in 0..<count {
            if let meals = currentState?.meals![i] as? Meals {
                    calSum += meals.proteinField
                }
            }
            return calSum
            
            case.carbField:
            var calSum: Int16 = 0
            let count = currentState!.meals!.count
            for i in 0..<count {
                if let meals = currentState?.meals![i] as? Meals {
                    calSum += meals.carbField
                }
            }
            return calSum
            
        case.fatField:
            var calSum: Int16 = 0
            let count = currentState!.meals!.count
            for i in 0..<count {
                if let meals = currentState?.meals![i] as? Meals {
                    calSum += meals.fatField
                }
            }
            return calSum
        }
        
    }
}


