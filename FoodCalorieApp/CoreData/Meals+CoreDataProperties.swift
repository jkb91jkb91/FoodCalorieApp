//
//  Meals+CoreDataProperties.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-29.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//

import Foundation
import CoreData


extension Meals {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meals> {
        return NSFetchRequest<Meals>(entityName: "Meals")
    }

    @NSManaged public var productField: String?
    @NSManaged public var proteinField: Int16
    @NSManaged public var carbField: Int16
    @NSManaged public var fatField: Int16
    @NSManaged public var calorieField: Int16
    @NSManaged public var dzien: Day?

}
