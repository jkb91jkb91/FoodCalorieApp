//
//  Day+CoreDataProperties.swift
//  FoodCalorieApp
//
//  Created by XCodeClub on 2019-08-29.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//

import Foundation
import CoreData


extension Day {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Day> {
        return NSFetchRequest<Day>(entityName: "Day")
    }

    @NSManaged public var wartosc: String?
    @NSManaged public var meals: NSOrderedSet?

}

// MARK: Generated accessors for meals
extension Day {

    @objc(insertObject:inMealsAtIndex:)
    @NSManaged public func insertIntoMeals(_ value: Meals, at idx: Int)

    @objc(removeObjectFromMealsAtIndex:)
    @NSManaged public func removeFromMeals(at idx: Int)

    @objc(insertMeals:atIndexes:)
    @NSManaged public func insertIntoMeals(_ values: [Meals], at indexes: NSIndexSet)

    @objc(removeMealsAtIndexes:)
    @NSManaged public func removeFromMeals(at indexes: NSIndexSet)

    @objc(replaceObjectInMealsAtIndex:withObject:)
    @NSManaged public func replaceMeals(at idx: Int, with value: Meals)

    @objc(replaceMealsAtIndexes:withMeals:)
    @NSManaged public func replaceMeals(at indexes: NSIndexSet, with values: [Meals])

    @objc(addMealsObject:)
    @NSManaged public func addToMeals(_ value: Meals)

    @objc(removeMealsObject:)
    @NSManaged public func removeFromMeals(_ value: Meals)

    @objc(addMeals:)
    @NSManaged public func addToMeals(_ values: NSOrderedSet)

    @objc(removeMeals:)
    @NSManaged public func removeFromMeals(_ values: NSOrderedSet)

}
