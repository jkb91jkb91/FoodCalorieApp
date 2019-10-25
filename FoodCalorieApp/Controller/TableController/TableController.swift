//
//  Table.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-06.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

//MARK:-Modules

import UIKit
import ObjectiveC
import CoreData

//MARK: Class

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
    
    let cellIdentifier = "cell"
    var currentState : Day? 

//MARK: -Lifecycle
    
    override func loadView() {
        self.view = TableViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        let date = showDate(type: .normal, dateString: nil)
        //CoreDataService.fetchData(date: date, currentState: currentState!)
        
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
            } catch let error as NSError {
            print ( "\(error)")
        }
        updateLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.table.reloadData()
            self.updateLabels()
        }
    }
    
//MARK:-UISetup
    
    func setupUI() {
        table.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        table.dataSource = self
        table.delegate = self
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        arrowButton1.addTarget(self, action: #selector(rightArrowAction), for: .touchUpInside)
        arrowButton2.addTarget(self, action: #selector(leftAction), for: .touchUpInside)
    }
    
//MARK:-TargetActions
    
    @objc func showAlert() {
        AlertService.showAlert(vc: self, currentDay: currentState!)
    }
   
    @objc func rightArrowAction() {
        let current = currentState!.wartosc
        let plusOneDay = showDate(type: .forward, dateString: current)
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
        let backOneDay = showDate(type: .back, dateString: current)
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
    
    //MARK: -Functions

       func showDate(type: DateType, dateString: String?) -> String {
           switch type {
           case .normal:
            return DateFormatterService.currendDate()
           case .forward:
             return DateFormatterService.formatterCounter(value: 1, date: dateString!)
           case .back:
            return DateFormatterService.formatterCounter(value: 1, date: dateString!)
           }
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
