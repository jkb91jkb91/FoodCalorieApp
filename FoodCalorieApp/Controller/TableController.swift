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




class TableController: UIViewController  {
    
    //MARK: - Outlets
    
    unowned var tableViews: TableViews { return self.view as! TableViews}
    unowned var table: UITableView { return tableViews.table}
    unowned var button: UIButton { return tableViews.button}
    unowned var arrowButton1 : UIButton { return tableViews.arrowButton1}
    unowned var arrowButton2 : UIButton { return tableViews.arrowButton2}
    unowned var dateLabel: UILabel {return tableViews.dateLabel}
    unowned var label: UILabel { return tableViews.label}
    unowned var proteinLabelText : UILabel { return tableViews.proteinLabelText}
    unowned var carbLabelText: UILabel { return tableViews.carbLabelText}
    unowned var fatLabelText: UILabel { return tableViews.fatLabelText}
    
  
    
    //MARK: - Properties
    
    var currentState : Day?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    //MARK: -Lifecycle
    
    override func loadView() {
        self.view = TableViews()
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        table.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self
        table.delegate = self
        
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        arrowButton1.addTarget(self, action: #selector(rightArrowAction), for: .touchUpInside)
        arrowButton2.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
        
 
        let date = takeDate(type: .normal, dateString: nil)
        print(date)
        
        
        let fetch :NSFetchRequest<Day> = Day.fetchRequest()
        fetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Day.wartosc),date)
        
        do {
            
            let result = try context.fetch(fetch)
            if result.count > 0 {
                currentState = result.first
                dateLabel.text = currentState?.wartosc
 
            } else {
                
                let dzien = Day(context: context)
                dzien.wartosc = date
                currentState = dzien
                try context.save()
                
                dateLabel.text = date
                print("niewie")
            }
            
        }catch let error as NSError {
            print ( "\(error)")
        }
        updateLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        table.reloadData()
        updateLabels()
    
    }
    
   
    
   
    //MARK: -Functions

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
                dateLabel.text = currentState?.wartosc
                print("miejstuTU")
            } else {
                
                let dzien = Day(context: context)
                dzien.wartosc = plusOneDay
                try context.save()
                self.currentState = dzien
                dateLabel.text = currentState?.wartosc
                print("DrugieMiejsc")
                
            }
            
        }catch let error as NSError {
            print ( "\(error)")
            }
        updateLabels()
        table.reloadData()

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
                dateLabel.text = currentState?.wartosc
            } else {
                
                let dzien = Day(context: context)
                dzien.wartosc = backOneDay
                try context.save()
                currentState = dzien
                dateLabel.text = currentState?.wartosc
            }
            
        }catch let error as NSError {
            print ( "\(error)")
            
    }
        updateLabels()
       table.reloadData()
    }
    
    func updateLabels() {

        label.text = "\(String(self.sumMacro(macro: MacroDataType.calorieField))) kcal"
        print(self.sumMacro(macro: MacroDataType.calorieField))
        proteinLabelText.text = String(self.sumMacro(macro: MacroDataType.proteinField))
        carbLabelText.text = String(self.sumMacro(macro: MacroDataType.carbField))
        fatLabelText.text = String(self.sumMacro(macro: MacroDataType.fatField))
     
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
//MARK: -UITableViweDataSource

extension TableController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          
          guard let meals = currentState?.meals else {
              return 0
          }
          return meals.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        guard let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
              return UITableViewCell() }
          
          guard let meals = currentState?.meals?[indexPath.row] as? Meals
              else {
              return cell
              }
      
          cell.updateCell(meal: meals)

          return cell
      }
}


//MARK: - UITableViewDelegate

extension TableController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               
               guard let toRemove = currentState?.meals![indexPath.row] as? Meals else {
                   return
               }
               
               context.delete(toRemove)
               
               do {
                   
                   try context.save()
                   table.deleteRows(at: [indexPath], with: .automatic)
               } catch let error as NSError {
                   print("\(error)")
               }
           }
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           
           return CGFloat(100)
       }
     
       
}
