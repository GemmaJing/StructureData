//
//  searchDatabase.swift
//  StructureData
//
//  Created by Gemma Jing on 20/10/2017.
//  Copyright © 2017 Gemma Jing. All rights reserved.
//

import Foundation
// MARK: search method called from main
func searchForUser(){
    // first round search
    print(":) Enter a food item: ")
    let foodToSearch = (readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!
    print(":) Searching for " + foodToSearch + "...")
    
    let itemsFound = searchItem(foodToSearch: foodToSearch) as! [FoodInfo]
    
    // second round search
    if(itemsFound.count>0){
        print("Do you mean these?")
        var i = 0
        for element in itemsFound{
            print(i)
            print(element.Food_Name)
            i = i + 1
        }
        print("Please specify food by index: ")
        let index = Int(readLine()!)
        let item = itemsFound[index!]
        
        print("do you mean: " + item.Food_Name)
        print(item)
    }
    else {
        print(":( Can not find the food item from the database")
    }
}


// MARK: 1st search from the database time input form the user:  foodToSearch
func searchItem(foodToSearch: String) -> [FoodInfo?]{
    var itemTargeted: [FoodInfo] = []
    
    let dataSize = database.count
    var i = 0
    
    while i < dataSize{
        let item = database[i]
        if (item.Food_Name.range(of: foodToSearch) != nil){
            itemTargeted.append(item)
        }
        i = i + 1
    }
    return itemTargeted
}
