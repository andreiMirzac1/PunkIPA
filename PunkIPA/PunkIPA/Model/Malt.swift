//
//  Malt.swift
//  PunkIPA
//
//  Created by Andrei Mirzac on 05/05/2020.
//  Copyright © 2020 Andrei Mirzac. All rights reserved.
//

import Foundation

// MARK: - Malt
struct Malt: Codable, Ingredient {
    let name: String
    let amount: BoilVolume
}
