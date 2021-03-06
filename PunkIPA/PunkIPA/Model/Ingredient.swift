//
//  Ingredient.swift
//  PunkIPA
//
//  Created by Andrei Mirzac on 05/05/2020.
//  Copyright © 2020 Andrei Mirzac. All rights reserved.
//

import Foundation

protocol Ingredient {
    var name: String {  get }
    var amount: BoilVolume { get }
}
