//
//  Hop.swift
//  PunkIPA
//
//  Created by Andrei Mirzac on 05/05/2020.
//  Copyright © 2020 Andrei Mirzac. All rights reserved.
//

import Foundation

// MARK: - Hop
struct Hop: Codable, Ingredient {
    let name: String
    let amount: BoilVolume
    let add, attribute: String
}
