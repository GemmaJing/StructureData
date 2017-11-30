//
//  foodNutrientsStruct.swift
//  StructureData
//
//  Created by Gemma Jing on 20/10/2017.
//  Copyright © 2017 Gemma Jing. All rights reserved.
//

import Foundation
// MARK: struc to save all food information
// there are 2897 food items
struct FoodInfo: Decodable {
    let Food_Name: String
    let Water_g: Double
    let Protein_g: Double
    let Fat_g: Double
    let Carbohydrate_g: Double
    let NSP_g: Double
    let Energy_kcal: Double
    let AOAC_fibre_g: Double
    let Sodium_mg: Double
    let Potassium_mg: Double
    let Calcium_mg: Double
    let Magnesium_mg: Double
    let Phosphorus_mg: Double
    let Iron_mg: Double
    let Copper_mg: Double
    let Zinc_mg: Double
    let Chloride_mg: Double
    let Manganese_mg: Double
    let Selenium_microg: Double
    let Iodine_microg: Double
    let Retinol_microg: Double
    let Carotene_microg: Double
    let Retinol_Equivalent_microg: Double
    let Vitamin_D_microg: Double
    let Vitamin_E_mg: Double
    let Vitamin_K1_microg: Double
    let Thiamin_mg: Double
    let Riboflavin_mg: Double
    let Niacin_mg: Double
    let TryptophanP60_mg: Double
    let NiacinEquivalent_mg: Double
    let Vitamin_B6_mg: Double
    let Vitamin_B12_microg: Double
    let Folate_microg: Double
    let Pantothenate_mg: Double
    let Biotin_microg: Double
    let Vitamin_C_mg: Double
    let Minerals_mg: Double
    let Vitamin_mg: Double
    let NewTotal: Double
};

// MARK: formatting the json text
// To modify the original string to readable JSON:
// 1. Change "null" to 0
// 2. Remove "\n  ", "\n", " }", space after ": " and change other " " to "_"
// 3. Add on "}" for all
// 4. Delete the comma if there is one at the start
func formatForJson(contents: String) -> [String]?{
    let content_null = contents.replacingOccurrences(of: "null", with: "0")
    let lines = content_null.split(separator: "}", maxSplits: 2897, omittingEmptySubsequences: true)

    var jsonString : [String] = []
    
    for element in lines{
        let mod_line_trim = element.trimmingCharacters(in: .whitespacesAndNewlines)
        var mod_line_n = mod_line_trim.replacingOccurrences(of: "\n   ", with: "")
        mod_line_n = mod_line_n.replacingOccurrences(of: "\n", with: "")
        let mod_line_back_bracket = mod_line_n.replacingOccurrences(of: " }", with: "}")
        let mod_line_col = mod_line_back_bracket.replacingOccurrences(of: ": ", with: ":")
        let mod_line_space = mod_line_col.replacingOccurrences(of: " ", with: "_")
       
        var mod_line_bracket = mod_line_space
        if mod_line_space.last != "}"{
            mod_line_bracket += "}"
        }
        
        //check if the first character is a comma and remove it
        if element.first == ","{
            mod_line_bracket.removeFirst()
            mod_line_bracket.removeFirst()
        }
        jsonString.append(mod_line_bracket)
    }
    return jsonString
}

// MARK: load json text file in a string
func loadFoodDatabase() -> [FoodInfo]?{
    let path = "/Users/gemmajing/Library/Mobile Documents/com~apple~CloudDocs/StructureData/StructureData/datasetJSON.json"
    var contents: String?
    try! contents = String(contentsOfFile: path)
    let jsonString = formatForJson(contents: contents!)
    var database: [FoodInfo] = []
    
    let decoder = JSONDecoder()
    for singleString in jsonString!{
        let jsonData = singleString.data(using: .utf8)!
        let food = try! decoder.decode(FoodInfo.self, from: jsonData)
        database.append(food)
    }
    return database
}
