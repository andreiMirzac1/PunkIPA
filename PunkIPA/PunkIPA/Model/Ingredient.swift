//
//  Ingredient.swift
//  Beers
//
//  Created by Andrei Mirzac on 13/06/2018.
//  Copyright © 2018 Andrei Mirzac. All rights reserved.
//

import Foundation

struct Ingredient: Codable, Parsable {
    let name: String
    let amount: Amount
}
