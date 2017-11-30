//
//  main.swift
//  tryingJsonRead
//
//  Created by Gemma Jing on 18/10/2017.
//  Copyright © 2017 Gemma Jing. All rights reserved.
//

import Foundation
// MARK: load all food information in the database -> FoodInfo struct
var database: [FoodInfo] = []
database = loadFoodDatabase()!


// MARK: search for food item
searchForUser()
