//
//  Beer.swift
//  PunkIPA
//
//  Created by Andrei Mirzac on 19/02/2020.
//  Copyright © 2020 Andrei Mirzac. All rights reserved.
//

import Foundation

struct Beer: Codable {
  let id: Int
  let name: String
  let abv: Double
  let imageUrl: String
  let description: String

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case abv
    case imageUrl = "image_url"
    case description
  }
}

